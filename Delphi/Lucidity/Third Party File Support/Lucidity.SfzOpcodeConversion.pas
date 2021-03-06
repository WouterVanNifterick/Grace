unit Lucidity.SfzOpcodeConversion;

interface

uses
  Lucidity.Enums,
  SfzParser.SfzOpcodes;

//================================================================================
//                HIGH LEVEL METHODS
//================================================================================


// converts a SFZ Opcode to a Lucidity patch value string.
// This method takes the SFZ value, ensures the source is using a valid range,
// converts to a correctly scaled Lucidity Patch value.
function ConvertOpcodeToPatchValue(const Opcode : TSfzOpcode; OpcodeValue : string):string;

// Converts a SFZ opcode to a lucidity patch value string.
// This method is similar to the above but should be used when the "Voice parameter" value uses
// a different scaling than the "sample region" value.
function ConvertOpcodeToVoiceParameterValue(const Opcode : TSfzOpcode; OpcodeValue : string):string;



//================================================================================
//                LOW LEVEL METHODS
//================================================================================

// General purpose opcode conversion
function OpcodeToInteger(const Value : string):integer; overload;
function OpcodeToInteger(const Value : string; const MinValue, MaxValue:integer):integer; overload;
function OpcodeToFloat(const Value : string):single; overload;
function OpcodeToFloat(const Value : string; const MinValue, MaxValue:single):single; overload;

// Opcode conversion for specific opcodes.
// These methods convert SFZ opcodes to Lucidity parameter values...
function OpcodeToTriggerMode(const Value : string): TKeyGroupTriggerMode; //TODO:MED the result should be a string.
function OpcodeToFilterType(const Value : string): string;



implementation

uses
  LucidityParameterScaling,
  Math,
  VamLib.Utils,
  VamLibDsp.Utils,
  SysUtils;

function OpcodeToTriggerMode(const Value : string): TKeyGroupTriggerMode;
begin
  if SameText(Value, 'no_loop')         then exit(TKeyGroupTriggerMode.LoopOff);
  if SameText(Value, 'one_shot')        then exit(TKeyGroupTriggerMode.OneShot);
  if SameText(Value, 'loop_continuous') then exit(TKeyGroupTriggerMode.LoopContinuous);
  if SameText(Value, 'loop_sustain')    then exit(TKeyGroupTriggerMode.LoopSustain);

  // If we've made it this far, the value isn't a valid SFZ opcode.
  raise EConvertError.Create('Value is not valid opcode for this conversion type.');
end;

function OpcodeToFilterType(const Value : string): string;
begin
  // Convert SFZ opcode "fil_type" to TFilterType.

  if SameText(Value, 'lpf_1p')  then exit(TFilterTypeHelper.ToUnicodeString(TFilterType.ft2PoleLowPass));  //should be one-pole low pass.   //TODO:MED
  if SameText(Value, 'hpf_1p')  then exit(TFilterTypeHelper.ToUnicodeString(TFilterType.ft2PoleHighPass)); //should be one-pole high pass. //TODO:MED
  if SameText(Value, 'lpf_2p')  then exit(TFilterTypeHelper.ToUnicodeString(TFilterType.ft2PoleLowPass));
  if SameText(Value, 'hpf_2p')  then exit(TFilterTypeHelper.ToUnicodeString(TFilterType.ft2PoleHighPass));
  if SameText(Value, 'bpf_2p')  then exit(TFilterTypeHelper.ToUnicodeString(TFilterType.ft2PoleBandPass));
  if SameText(Value, 'brf_2p')  then exit(TFilterTypeHelper.ToUnicodeString(TFilterType.ft2PoleLowPass)); //should be two-pole band rejection filter

  // If we've made it this far, the value isn't a valid SFZ opcode.
  raise EConvertError.Create('Value is not valid opcode for this conversion type.');

  //TODO:HIGH I need to write some more filters specifically for SFZ compatibility.
end;

function OpcodeToInteger(const Value : string):integer;
var
  x : integer;
begin
  if IsMidiKeyNameString(Value, x) then
  begin
    result := x;
  end else
  if TryStrToInt(Value, x) then
  begin
    result := x;
  end else
  begin
    raise EConvertError.Create('Value is not an integer.');
  end;
end;

function OpcodeToInteger(const Value : string; const MinValue, MaxValue:integer):integer; overload;
var
  x : integer;
begin
  if IsMidiKeyNameString(Value, x) then
  begin
    if x < MinValue then x := MinValue;
    if x > MaxValue then x := MaxValue;
    result := x;
  end else
  if TryStrToInt(Value, x) then
  begin
    if x < MinValue then x := MinValue;
    if x > MaxValue then x := MaxValue;
    result := x;
  end else
  begin
    raise EConvertError.Create('Value is not an integer.');
  end;
end;

function OpcodeToFloat(const Value : string):single;
var
  fs:TFormatSettings;
begin
  fs.ThousandSeparator := ',';
  fs.DecimalSeparator  := '.';
  try
    result := StrToFloat(Value, fs)
  except
    raise EConvertError.Create('Value is not a valid float.');
  end;
end;

function OpcodeToFloat(const Value : string; const MinValue, MaxValue:single):single; overload;
var
  x : single;
  fs:TFormatSettings;
begin
  fs.ThousandSeparator := ',';
  fs.DecimalSeparator  := '.';
  try
    x := StrToFloat(Value, fs);
    if x < MinValue then x := MinValue;
    if x > MaxValue then x := MaxValue;
    result := x;
  except
    raise EConvertError.Create('Value is not a valid float.');
  end;
end;


function ConvertOpcodeToVoiceParameterValue(const Opcode : TSfzOpcode; OpcodeValue : string):string;
var
  xInt : integer;
  xFloat : single;
begin
  // TODO:MED Memory leaks if this method raises an exception while loading a SFZ patch.
  try
    OpcodeValue := Trim(OpcodeValue);

    // set Result to a default value.
    result := '';

    // do the conversion.
    case Opcode of
      TSfzOpcode.transpose:
      begin
        // SFZ: The transposition value for this region which will be applied to the sample.
        // Lucidity. Max transposition is -24 to 24 semitones, normalised to 0..1 range.
        xInt := OpcodeToInteger(OpcodeValue, -127, 127);
        xFloat := Clamp(xInt, -24, 24);
        xFloat := (xFloat + 24) / 48;
        xFloat := Clamp(xInt, 0, 1);
        result := DataIO_FloatToStr(xFloat);
      end;
      TSfzOpcode.tune:
      begin
        // SFZ: Sample fine tune. -100..100 cents
        // Lucidity. Fine tune range is -100..100 cents (1 Semitone) normalised to 0..1 range.
        xInt := OpcodeToInteger(OpcodeValue, -100, 100);
        xFloat := (xInt + 100) / 200;
        xFloat := Clamp(xFloat, 0, 1);
        result := DataIO_FloatToStr(xFloat);
      end;
      TSfzOpcode.volume:
      begin
        // === SFZ Import Notes ===
        // The volume for the region, in decibels. -144 to 6 dB
        // == Lucidity Import Notes ==
        // Lucidty format units are *decibels*.
        xFloat := OpcodeToFloat(OpcodeValue, -144, 6);
        xFloat := DecibelsToLinear(xFloat);
        xFloat := Clamp(xFloat, 0, 4);
        xFloat := xFloat / 4;
        if xFloat > 0 then xFloat := sqrt(xFloat);
        result := DataIO_FloatToStr(xFloat);
      end;
    else
      // Fallback to the standard scaling if a custom "voice parameter" only version isn't applied.
      result := ConvertOpcodeToPatchValue(Opcode, OpcodeValue);
    end;
  except
    on E:EConvertError do
    begin
      raise EConvertError.Create('Can not convert SFZ opcode. [ ' + SfzOpcodeToStr(Opcode) + '=' + OpcodeValue + ' ]');
    end else
    begin
      raise;
    end;
  end;
end;


function ConvertOpcodeToPatchValue(const Opcode : TSfzOpcode; OpcodeValue : string):string;
var
  xInt : integer;
  xFloat : single;
  TriggerMode : TKeyGroupTriggerMode;
begin
  // TODO:MED Memory leaks if this method raises an exception while loading a SFZ patch.
  try
    OpcodeValue := Trim(OpcodeValue);

    // set Result to a default value.
    result := '';

    // do the conversion.
    case Opcode of
      TSfzOpcode.Unknown: ;
      TSfzOpcode.sample:
      begin
        // This opcode defines which sample file the region will play.
        // The value of this opcode is the filename of the sample file,
        // including the extension. The filename must be stored in the
        // same folder where the definition file is, or specified relatively to it.
        result := OpcodeValue;
      end;

      TSfzOpcode.lochan:
      begin

      end;

      TSfzOpcode.hichan:
      begin

      end;
      //==========================================================================
      // == lokey, hikey, key ==
      // If a note equal to or higher than lokey AND equal to or lower than hikey is played, the region will play.
      // lokey and hikey can be entered in either MIDI note numbers (0 to 127) or in MIDI note names (C-1 to G9)
      // The key opcode sets lokey, hikey and pitch_keycenter to the same note.
      // range:
      //   0 to 127
      //   C-1 to G9
      // TODO:HIGH notice the SFZ key range. I need to write a function
      // to translate SFZ midi key names to integers. My routine in VamLib.Utils
      // isn't correct WRT the SFZ format.
      TSfzOpcode.lokey:
      begin
         xInt := OpcodeToInteger(OpcodeValue, 0, 127);
         result := DataIO_IntToStr(xInt);
      end;
      TSfzOpcode.hikey:
      begin
        xInt := OpcodeToInteger(OpcodeValue, 0, 127);
        result := DataIO_IntToStr(xInt);
      end;
      TSfzOpcode.key:
      begin
        xInt := OpcodeToInteger(OpcodeValue, 0, 127);
        result := DataIO_IntToStr(xInt);
      end;
      //==========================================================================
      // If a note with velocity value equal to or higher than lovel AND equal
      // to or lower than hivel is played, the region will play.
      // range: 0-127
      TSfzOpcode.lovel:
      begin
        xInt := OpcodeToInteger(OpcodeValue, 0, 127);
        result := DataIO_IntToStr(xInt);
      end;
      TSfzOpcode.hivel:
      begin
        xInt := OpcodeToInteger(OpcodeValue, 0, 127);
        result := DataIO_IntToStr(xInt);
      end;
      //==========================================================================
      TSfzOpcode.lobend: ;
      TSfzOpcode.hibend: ;
      TSfzOpcode.lochanaft: ;
      TSfzOpcode.hichanaft: ;
      TSfzOpcode.lopolyaft: ;
      TSfzOpcode.hipolyaft: ;
      TSfzOpcode.lorand: ;
      TSfzOpcode.hirand: ;
      TSfzOpcode.lobpm: ;
      TSfzOpcode.hibpm: ;
      TSfzOpcode.seq_length: ;
      TSfzOpcode.seq_position: ;
      TSfzOpcode.sw_lokey: ;
      TSfzOpcode.sw_hikey: ;
      TSfzOpcode.sw_last: ;
      TSfzOpcode.sw_down: ;
      TSfzOpcode.sw_up: ;
      TSfzOpcode.sw_previous: ;
      TSfzOpcode.sw_vel: ;
      TSfzOpcode.trigger: ;
      TSfzOpcode.group: ;
      TSfzOpcode.off_by: ;
      TSfzOpcode.off_mode: ;
      TSfzOpcode.on_loccN: ;
      TSfzOpcode.on_hiccN: ;
      TSfzOpcode.delay: ;
      TSfzOpcode.delay_random: ;
      TSfzOpcode.delay_ccN: ;
      TSfzOpcode.offset: ;
      TSfzOpcode.offset_random: ;
      TSfzOpcode.offset_ccN: ;
      TSfzOpcode.sample_end:
      begin
        // === SFZ Import Notes ===
        // The endpoint of the sample, in sample units.
        // The player will reproduce the whole sample if end is not specified.
        // If end value is -1, the sample will not play. Marking a region end
        // with -1 can be used to use a silent region to turn off other
        // regions by using the group and off_by opcodes.
        xInt := OpcodeToInteger(OpcodeValue);
        result := DataIO_IntToStr(xInt);
      end;
      TSfzOpcode.count: ;
      TSfzOpcode.loop_mode:
      begin
        TriggerMode := OpcodeToTriggerMode(OpcodeValue);
        result := TKeyGroupTriggerModeHelper.ToUnicodeString(TriggerMode);
      end;
      TSfzOpcode.loop_start:
      begin
        // The loop start point, in samples.
        // If loop_start is not specified and the sample has a loop defined,
        // the sample start point will be used.
        // If loop_start is specified, it will overwrite the loop start point
        // defined in the sample.
        // This opcode will not have any effect if loopmode is set to no_loop.
        // SFZ Range: 0 to 4 Gb (4294967296)
        xInt := OpcodeToInteger(OpcodeValue);
        if xInt <0 then xInt := 0;
        result := DataIO_IntToStr(xInt);
      end;
      TSfzOpcode.loop_end:
      begin
        // The loop end point, in samples. This opcode will not have any effect
        // if loopmode is set to no_loop.
        // If loop_end is not specified and the sample have a loop defined, the
        // sample loop end point will be used.
        // If loop_end is specified, it will overwrite the loop end point defined
        // in the sample.
        xInt := OpcodeToInteger(OpcodeValue);
        if xInt <0 then xInt := 0;
        result := DataIO_IntToStr(xInt);
      end;
      TSfzOpcode.sync_beats: ;
      TSfzOpcode.sync_offset: ;
      TSfzOpcode.transpose:
      begin
        // === SFZ Import Notes ===
        // The transposition value for this region which will be applied to the sample.
        // (I think it's in semitones but the documentation doesn't say)
        // == Lucidity Import Notes ==
        // Lucidty format units are *semitones*.
        xInt := OpcodeToInteger(OpcodeValue, -127, 127);
        result := DataIO_IntToStr(xInt);
      end;
      TSfzOpcode.tune:
      begin
        // === SFZ Import Notes ===
        // The fine tuning for the sample, in cents. Range is *ERROR* semitone,
        // from -100 to 100. Only negative values must be prefixed with sign.
        // == Lucidity Import Notes ==
        // Lucidty format units are *cents*.
        xInt := OpcodeToInteger(OpcodeValue, -100, 100);
        result := DataIO_IntToStr(xInt);
      end;
      TSfzOpcode.pitch_keycenter:
      begin
        // Root key for the sample.
        // SFZ range: -127 to 127.
        // Lucidity range is 0 to 127
        xInt := OpcodeToInteger(OpcodeValue, 0, 127);
        result := DataIO_IntToStr(xInt);
      end;
      TSfzOpcode.pitch_keytrack: ;
      TSfzOpcode.pitch_veltrack:
      begin

      end;
      TSfzOpcode.pitch_random: ;
      TSfzOpcode.bend_up: ;
      TSfzOpcode.bend_down: ;
      TSfzOpcode.bend_step: ;
      TSfzOpcode.pitcheg_delay: ;
      TSfzOpcode.pitcheg_start: ;
      TSfzOpcode.pitcheg_attack: ;
      TSfzOpcode.pitcheg_hold: ;
      TSfzOpcode.pitcheg_decay: ;
      TSfzOpcode.pitcheg_sustain: ;
      TSfzOpcode.pitcheg_release: ;
      TSfzOpcode.pitcheg_depth: ;
      TSfzOpcode.pitcheg_vel2delay: ;
      TSfzOpcode.pitcheg_vel2attack: ;
      TSfzOpcode.pitcheg_vel2hold: ;
      TSfzOpcode.pitcheg_vel2decay: ;
      TSfzOpcode.pitcheg_vel2sustain: ;
      TSfzOpcode.pitcheg_vel2release: ;
      TSfzOpcode.pitcheg_vel2depth: ;
      TSfzOpcode.pitchlfo_delay: ;
      TSfzOpcode.pitchlfo_fade: ;
      TSfzOpcode.pitchlfo_freq: ;
      TSfzOpcode.pitchlfo_depth: ;
      TSfzOpcode.pitchlfo_depthccN: ;
      TSfzOpcode.pitchlfo_depthchanaft: ;
      TSfzOpcode.pitchlfo_depthpolyaft: ;
      TSfzOpcode.pitchlfo_freqccN: ;
      TSfzOpcode.pitchlfo_freqchanaft: ;
      TSfzOpcode.pitchlfo_freqpolyaft: ;
      TSfzOpcode.fil_type: result := OpcodeToFilterType(OpcodeValue);
      TSfzOpcode.cutoff:
      begin
        // == SFZ Import ==
        // The filter cutoff frequency, in Hertz.
        // If the cutoff is not specified, the filter will be disabled,
        // with the consequent CPU drop in the player.
        // == Lucidity Import ==
        // Lucidity expects a 0 to 1 range parameter value.
        // The 0-1 range is mapped to a 6-20000hz filter frequency
        // using an exponential scale.
        xFloat := OpcodeToFloat(OpcodeValue, 0, 20000);
        if xFloat <> 0
          then xFloat := FilterFrequencyToVstFloat(xFloat);
        xFloat := Clamp(xFloat, 0, 1);
        result := DataIO_FloatToStr(xFloat);
      end;
      TSfzOpcode.cutoff_ccN: ;
      TSfzOpcode.cutoff_chanaft: ;
      TSfzOpcode.cutoff_polyaft: ;
      TSfzOpcode.resonance:
      begin
        // == SFZ Import ==
        // The filter cutoff resonance value, in decibels. range 0-40dB
        // == Lucidity Import ==
        // Lucidity expects a 0 to 1 range parameter value.
        xFloat := OpcodeToFloat(OpcodeValue, 0, 40);
        result := DataIO_FloatToStr(xFloat / 40);
      end;
      TSfzOpcode.fil_keytrack:
      begin
        // == SFZ Import ==
        // Filter keyboard tracking (change on cutoff for each key) in cents.
        // Type: Integer.
        // == Lucidity Import ==
        // Lucidity expects a 0-1 ranged parameter value
        // which is scaled to 0-100% key tracking.
        //=============
        // NOTE: The SFZ fil_keytrack value is an integer
        // but we are reading it in as a float.
        xFloat := OpcodeToFloat(OpcodeValue, 0, 100);
        result := DataIO_FloatToStr(xFloat / 100);
      end;
      TSfzOpcode.fil_keycenter: ; // ignored in lucidity patches. //TODO:HIGH this could actually be implemented by using the mod matrix
      TSfzOpcode.fil_veltrack:
      begin
      // === SFZ Import Notes ===
        // Amplifier velocity tracking, represents how much the amplitude changes
        // with incoming note velocity. Range: -100 to 100%.
        // Type: floating point.
        // == Lucidity Import Notes ==
        //
        xFloat := OpcodeToFloat(OpcodeValue, 0, 100);
        if (xFloat < 10) then  result := TEnvVelocityDepthHelper.ToUnicodeString(TEnvVelocityDepth.VelOff)
        else if (xFloat < 30) then  result := TEnvVelocityDepthHelper.ToUnicodeString(TEnvVelocityDepth.Vel20)
        else if (xFloat < 50) then  result := TEnvVelocityDepthHelper.ToUnicodeString(TEnvVelocityDepth.Vel40)
        else if (xFloat < 70) then  result := TEnvVelocityDepthHelper.ToUnicodeString(TEnvVelocityDepth.Vel60)
        else if (xFloat < 90) then  result := TEnvVelocityDepthHelper.ToUnicodeString(TEnvVelocityDepth.Vel80)
        else result := TEnvVelocityDepthHelper.ToUnicodeString(TEnvVelocityDepth.Vel100);
      end;
      TSfzOpcode.fil_random: ;    // ignored in lucidity patches. //TODO:HIGH this could actually be implemented by using the mod matrix
      TSfzOpcode.fileg_delay: ;
      TSfzOpcode.fileg_start: ;
      TSfzOpcode.fileg_attack:
      begin
        // == SFZ Import ==
        // Filter EG attack time, in seconds.
        // Type: floating point
        // == Lucidity Import ==
        //
        xFloat := OpcodeToFloat(OpcodeValue, 0, 8);
        xFloat := xFloat/8;
        xFloat := Power(xFloat, 1/3);
        result := DataIO_FloatToStr(xFloat);
      end;
      TSfzOpcode.fileg_hold:
      begin
        // == SFZ Import ==
        // Filter EG hold time, in seconds.
        // Type: floating point
        // == Lucidity Import ==
        //
        xFloat := OpcodeToFloat(OpcodeValue, 0, 0.5);
        xFloat := xFloat/0.5;
        xFloat := Power(xFloat, 1/2);
        result := DataIO_FloatToStr(xFloat);
      end;
      TSfzOpcode.fileg_decay:
      begin
        // == SFZ Import ==
        // Filter EG decay time, in seconds.
        // Type: floating point
        // == Lucidity Import ==
        //
        xFloat := OpcodeToFloat(OpcodeValue, 0, 8);
        xFloat := xFloat/8;
        xFloat := Power(xFloat, 1/3);
        result := DataIO_FloatToStr(xFloat);
      end;
      TSfzOpcode.fileg_sustain:
      begin
        // == SFZ Import ==
        // Filter EG sustain in percentage.
        // Type: floating point
        // == Lucidity Import ==
        //
        xFloat := OpcodeToFloat(OpcodeValue, 0, 100);
        xFloat := xFloat/100;
        result := DataIO_FloatToStr(xFloat);
      end;
      TSfzOpcode.fileg_release:
      begin
        // == SFZ Import ==
        // Filter EG release time, in seconds.
        // Type: floating point
        // == Lucidity Import ==
        //
        xFloat := OpcodeToFloat(OpcodeValue, 0, 8);
        xFloat := xFloat/8;
        xFloat := Power(xFloat, 1/3);
        result := DataIO_FloatToStr(xFloat);
      end;
      TSfzOpcode.fileg_depth:
      begin
        // == SFZ Import ==
        // Depth for the filter EG, in cents. Range -12000 to 12000
        //
        // == Lucidity Import ==
        //
        xFloat := OpcodeToFloat(OpcodeValue, 0, 12000);
        xFloat := xFloat / 12000;
        result := DataIO_FloatToStr(xFloat);
      end;
      TSfzOpcode.fileg_vel2delay: ;
      TSfzOpcode.fileg_vel2attack: ;
      TSfzOpcode.fileg_vel2hold: ;
      TSfzOpcode.fileg_vel2decay: ;
      TSfzOpcode.fileg_vel2sustain: ;
      TSfzOpcode.fileg_vel2release: ;
      TSfzOpcode.fileg_vel2depth: ;
      TSfzOpcode.fillfo_delay: ;
      TSfzOpcode.fillfo_fade: ;
      TSfzOpcode.fillfo_freq: ;
      TSfzOpcode.fillfo_depth: ;
      TSfzOpcode.fillfo_depthccN: ;
      TSfzOpcode.fillfo_depthchanaft: ;
      TSfzOpcode.fillfo_depthpolyaft: ;
      TSfzOpcode.fillfo_freqccN: ;
      TSfzOpcode.fillfo_freqchanaft: ;
      TSfzOpcode.fillfo_freqpolyaft: ;
      TSfzOpcode.volume:
      begin
        // === SFZ Import Notes ===
        // The volume for the region, in decibels. -144 to 6 dB
        // == Lucidity Import Notes ==
        // Lucidty format units are *decibels*.
        xFloat := OpcodeToFloat(OpcodeValue, -144, 6);
        result := DataIO_FloatToStr(xFloat);
      end;
      TSfzOpcode.pan:
      begin
        // === SFZ Import Notes ===
        // The panoramic position for the region.
        // If a mono sample is used, pan value defines the position in the stereo
        // image where the sample will be placed.
        // When a stereo sample is used, the pan value the relative amplitude of one channel respect the other.
        // == Lucidity Import Notes ==
        // Lucidty format units are *decibels*.
        xFloat := OpcodeToFloat(OpcodeValue, -100, 100);
        result := DataIO_FloatToStr(xFloat);
      end;
      TSfzOpcode.width: ;
      TSfzOpcode.position: ;
      TSfzOpcode.amp_keytrack: ;
      TSfzOpcode.amp_keycenter: ;
      TSfzOpcode.amp_veltrack:
      begin
      // === SFZ Import Notes ===
        // Amplifier velocity tracking, represents how much the amplitude changes
        // with incoming note velocity. Range: -100 to 100%.
        // Type: floating point.
        // == Lucidity Import Notes ==
        //
        xFloat := OpcodeToFloat(OpcodeValue, 0, 100);
        if (xFloat < 10) then  result := TEnvVelocityDepthHelper.ToUnicodeString(TEnvVelocityDepth.VelOff)
        else if (xFloat < 30) then  result := TEnvVelocityDepthHelper.ToUnicodeString(TEnvVelocityDepth.Vel20)
        else if (xFloat < 50) then  result := TEnvVelocityDepthHelper.ToUnicodeString(TEnvVelocityDepth.Vel40)
        else if (xFloat < 70) then  result := TEnvVelocityDepthHelper.ToUnicodeString(TEnvVelocityDepth.Vel60)
        else if (xFloat < 90) then  result := TEnvVelocityDepthHelper.ToUnicodeString(TEnvVelocityDepth.Vel80)
        else result := TEnvVelocityDepthHelper.ToUnicodeString(TEnvVelocityDepth.Vel100);
      end;
      TSfzOpcode.amp_velcurve_1: ;
      TSfzOpcode.amp_velcurve_127: ;
      TSfzOpcode.amp_random: ;
      TSfzOpcode.rt_decay: ;
      TSfzOpcode.output: ;
      TSfzOpcode.gain_ccN: ;
      TSfzOpcode.xfin_lokey: ;
      TSfzOpcode.xfin_hikey: ;
      TSfzOpcode.xfout_lokey: ;
      TSfzOpcode.xfout_hikey: ;
      TSfzOpcode.xf_keycurve: ;
      TSfzOpcode.xfin_lovel: ;
      TSfzOpcode.xfin_hivel: ;
      TSfzOpcode.xfout_lovel: ;
      TSfzOpcode.xfout_hivel: ;
      TSfzOpcode.xf_velcurve: ;
      TSfzOpcode.xfin_loccN: ;
      TSfzOpcode.xfin_hiccN: ;
      TSfzOpcode.xfout_loccN: ;
      TSfzOpcode.xfout_hiccN: ;
      TSfzOpcode.xf_cccurve: ;
      TSfzOpcode.ampeg_delay: ;
      TSfzOpcode.ampeg_start:
      begin
        // == SFZ Import ==
        //
        // == Lucidity Import ==
        //

      end;
      TSfzOpcode.ampeg_attack:
      begin
        // == SFZ Import ==
        // Amplifier EG attack time, in seconds.
        // Type: floating point
        // == Lucidity Import ==
        //
        xFloat := OpcodeToFloat(OpcodeValue, 0, 8);
        xFloat := xFloat/8;
        xFloat := Power(xFloat, 1/3);
        result := DataIO_FloatToStr(xFloat);
      end;
      TSfzOpcode.ampeg_hold:
      begin
        // == SFZ Import ==
        // Amplifier EG hold time, in seconds. During the hold stage, EG output
        // will remain at its maximum value.
        // Type: floating point
        // == Lucidity Import ==
        //
        xFloat := OpcodeToFloat(OpcodeValue, 0, 0.5);
        xFloat := xFloat/0.5;
        xFloat := Power(xFloat, 1/2);
        result := DataIO_FloatToStr(xFloat);
      end;
      TSfzOpcode.ampeg_decay:
      begin
        // == SFZ Import ==
        // Amplifier EG decay time, in seconds.
        // Type: floating point
        // == Lucidity Import ==
        //
        xFloat := OpcodeToFloat(OpcodeValue, 0, 8);
        xFloat := xFloat/8;
        xFloat := Power(xFloat, 1/3);
        result := DataIO_FloatToStr(xFloat);
      end;
      TSfzOpcode.ampeg_sustain:
      begin
        // == SFZ Import ==
        // Amplifier EG sustain level, in percentage.
        // Type: floating point
        // == Lucidity Import ==
        //
        xFloat := OpcodeToFloat(OpcodeValue, 0, 100);
        xFloat := xFloat/100;
        result := DataIO_FloatToStr(xFloat);
      end;
      TSfzOpcode.ampeg_release:
      begin
        // == SFZ Import ==
        // Amplifier EG release time (after note release), in seconds.
        // Type: floating point
        // == Lucidity Import ==
        //
        xFloat := OpcodeToFloat(OpcodeValue, 0, 8);
        xFloat := xFloat/8;
        xFloat := Power(xFloat, 1/3);
        result := DataIO_FloatToStr(xFloat);
      end;
      TSfzOpcode.ampeg_vel2delay: ;
      TSfzOpcode.ampeg_vel2attack: ;
      TSfzOpcode.ampeg_vel2hold: ;
      TSfzOpcode.ampeg_vel2decay: ;
      TSfzOpcode.ampeg_vel2sustain: ;
      TSfzOpcode.ampeg_vel2release: ;
      TSfzOpcode.ampeg_delayccN: ;
      TSfzOpcode.ampeg_startccN: ;
      TSfzOpcode.ampeg_attackccN: ;
      TSfzOpcode.ampeg_holdccN: ;
      TSfzOpcode.ampeg_decayccN: ;
      TSfzOpcode.ampeg_sustainccN: ;
      TSfzOpcode.ampeg_releaseccN: ;
      TSfzOpcode.amplfo_delay: ;
      TSfzOpcode.amplfo_fade: ;
      TSfzOpcode.amplfo_freq: ;
      TSfzOpcode.amplfo_depth: ;
      TSfzOpcode.amplfo_depthccN: ;
      TSfzOpcode.amplfo_depthchanaft: ;
      TSfzOpcode.amplfo_depthpolyaft: ;
      TSfzOpcode.amplfo_freqccN: ;
      TSfzOpcode.amplfo_freqchanaft: ;
      TSfzOpcode.amplfo_freqpolyaft: ;
      TSfzOpcode.eq1_freq: ;
      TSfzOpcode.eq2_freq: ;
      TSfzOpcode.eq3_freq: ;
      TSfzOpcode.eq1_freqccN: ;
      TSfzOpcode.eq2_freqccN: ;
      TSfzOpcode.eq3_freqccN: ;
      TSfzOpcode.eq1_vel2freq: ;
      TSfzOpcode.eq2_vel2freq: ;
      TSfzOpcode.eq3_vel2freq: ;
      TSfzOpcode.eq1_bw: ;
      TSfzOpcode.eq2_bw: ;
      TSfzOpcode.eq3_bw: ;
      TSfzOpcode.eq1_bwccN: ;
      TSfzOpcode.eq2_bwccN: ;
      TSfzOpcode.eq3_bwccN: ;
      TSfzOpcode.eq1_gain: ;
      TSfzOpcode.eq2_gain: ;
      TSfzOpcode.eq3_gain: ;
      TSfzOpcode.eq1_gainccN: ;
      TSfzOpcode.eq2_gainccN: ;
      TSfzOpcode.eq3_gainccN: ;
      TSfzOpcode.eq1_vel2gain: ;
      TSfzOpcode.eq2_vel2gain: ;
      TSfzOpcode.eq3_vel2gain: ;
      TSfzOpcode.effect1: ;
      TSfzOpcode.effect2: ;
    else
      raise Exception.Create('Opcode type not handled.');
    end;
  except
    on E:EConvertError do
    begin
      raise EConvertError.Create('Can not convert SFZ opcode. [ ' + SfzOpcodeToStr(Opcode) + '=' + OpcodeValue + ' ]');
    end else
    begin
      raise;
    end;
  end;
end;

end.
