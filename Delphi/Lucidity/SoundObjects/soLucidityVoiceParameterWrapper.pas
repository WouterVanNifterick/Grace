unit soLucidityVoiceParameterWrapper;

interface

{$M+}

uses
  VamLib.ZeroObject,
  LucidityGui.VectorSequence,
  LucidityModConnections,
  uConstants, uLucidityEnums, soModMatrix,
  Lucidity.Interfaces,
  soLucidityVoice;

type
  //  forward declarations
  TLucidityVoiceParameterWrapper = class;
  //============================================================================

  TUpdateActionProcedure = reference to procedure(v:PLucidityVoice);

  IVoicePar = interface
    ['{FCE3B1A1-F6C1-480F-A69F-5E4ABDAE3F78}']
    function GetObject:TLucidityVoiceParameterWrapper;
  end;


  TLucidityVoiceParameterWrapper = class
  private
    fOscShape: single;
    fOscPulseWidth: single;
    fSamplePlaybackType: TSamplePlaybackType;
    fVoiceGain: single;
    fVoicePan: single;
    fVoicePitchOne: single;
    fVoicePitchTwo: single;
    fFilter1Type: TFilterType;
    fFilter2Type: TFilterType;
    fFilter1Par1: single;
    fFilter1Par2: single;
    fFilter1Par3: single;
    fFilter2Par1: single;
    fFilter2Par2: single;
    fFilter2Par3: single;
    fModAttack: single;
    fModHold: single;
    fModDecay: single;
    fModSustain: single;
    fModRelease: single;
    fLfoRate1: single;
    fLfoRate2: single;
    fSeq1Clock: TSequencerClock;
    fSeq1Direction: TStepSequencerDirection;
    fStepSeq1Length: TStepSequencerLength;
    fSeq2Clock: TSequencerClock;
    fSeq2Direction: TStepSequencerDirection;
    fStepSeq2Length: TStepSequencerLength;
    fGrainLoop: TGrainStretchLoopMode;
    fGrainLength: single;
    fGrainRate: single;
    fGrainPosition: single;
    fMixAuxB: single;
    fMixAuxA: single;
    fSamplerLoopBounds: TSamplerLoopBounds;
    fSampleReset: TClockSource;
    fLfoAPar2: single;
    fLfoBPar2: single;
    fAmpVelocityDepth: TEnvVelocityDepth;
    fModVelocityDepth: TEnvVelocityDepth;
    fVoiceMode: TVoiceMode;
    fVoiceGlide: single;
    fFilter1Par4: single;
    fFilter2Par4: single;
    fSamplerLoopMode: TKeyGroupTriggerMode;
    fPitchTracking: TPitchTracking;
    fLfoBPar3: single;
    fLfoAPar3: single;
    fFilter2KeyFollow: single;
    fFilter1KeyFollow: single;
    fLfoFreqMode2: TLfoFreqMode;
    fLfoFreqMode1: TLfoFreqMode;
    fFilterRouting: TFilterRouting;
    fLfoRange2: TLfoRange;
    fLfoRange1: TLfoRange;
    fLfoShape2: TLfoShape;
    fLfoShape1: TLfoShape;
    procedure SetFilter1Par1(const Value: single);
    procedure SetFilter1Par2(const Value: single);
    procedure SetFilter1Par3(const Value: single);
    procedure SetFilter1Type(const Value: TFilterType);
    procedure SetFilter2Par1(const Value: single);
    procedure SetFilter2Par2(const Value: single);
    procedure SetFilter2Par3(const Value: single);
    procedure SetFilter2Type(const Value: TFilterType);
    procedure SetModAttack(const Value: single);
    procedure SetModDecay(const Value: single);
    procedure SetModHold(const Value: single);
    procedure SetModRelease(const Value: single);
    procedure SetModSustain(const Value: single);
    procedure SetGrainLength(const Value: single);
    procedure SetGrainLoop(const Value: TGrainStretchLoopMode);
    procedure SetGrainPosition(const Value: single);
    procedure SetGrainRate(const Value: single);
    procedure SetLfoRate1(const Value: single);
    procedure SetLfoRate2(const Value: single);
    procedure SetLfoShape1(const Value: TLfoShape);
    procedure SetLfoShape2(const Value: TLfoShape);
    procedure SetOscPulseWidth(const Value: single);
    procedure SetOscShape(const Value: single);
    procedure SetSamplePlaybackType(const Value: TSamplePlaybackType);
    procedure SetSeq1Clock(const Value: TSequencerClock);
    procedure SetSeq1Direction(const Value: TStepSequencerDirection);
    procedure SetSeq2Clock(const Value: TSequencerClock);
    procedure SetSeq2Direction(const Value: TStepSequencerDirection);
    procedure SetStepSeq1Length(const Value: TStepSequencerLength);
    procedure SetStepSeq2Length(const Value: TStepSequencerLength);
    procedure SetVoiceGain(const Value: single);
    procedure SetVoicePan(const Value: single);
    procedure SetVoicePitchOne(const Value: single);
    procedure SetVoicePitchTwo(const Value: single);
    procedure SetMixAuxA(const Value: single);
    procedure SetMixAuxB(const Value: single);
    procedure SetSampleLoopBounds(const Value: TSamplerLoopBounds);
    procedure SetSampleReset(Value: TClockSource);
    procedure SetLfoAPar2(const Value: single);
    procedure SetLfoBPar2(const Value: single);
    procedure SetAmpVelocityDepth(const Value: TEnvVelocityDepth);
    procedure SetModVelocityDepth(const Value: TEnvVelocityDepth);
    procedure SetVoiceMode(const Value: TVoiceMode);
    procedure SetVoiceGlide(const Value: single);
    procedure SetFilter1Par4(const Value: single);
    procedure SetFilter2Par4(const Value: single);
    procedure SetSamplerLoopMode(const Value: TKeyGroupTriggerMode);
    procedure SetPitchTracking(const Value: TPitchTracking);
    procedure SetLfoAPar3(const Value: single);
    procedure SetLfoBPar3(const Value: single);
    procedure SetFilter1KeyFollow(const Value: single);
    procedure SetFilter2KeyFollow(const Value: single);
    procedure SetLfoFreqMode1(const Value: TLfoFreqMode);
    procedure SetLfoFreqMode2(const Value: TLfoFreqMode);
    procedure SetFilterRouting(const Value: TFilterRouting);
    procedure SetLfoRange1(const Value: TLfoRange);
    procedure SetLfoRange2(const Value: TLfoRange);
  protected
    OwningSampleGroup : Pointer; //weak reference to IKeyGroup
    Voices : PArrayOfLucidityVoice;
    VoiceCount : integer;
    fSeq1StepValues : array[0..kMaxStepSequencerLength-1] of single;
    fSeq2StepValues : array[0..kMaxStepSequencerLength-1] of single;


    procedure UpdateActiveVoices(UpdateAction:TUpdateActionProcedure);

    // VoiceMode and VoiceGlide are unused at this point. They might be used in future. Currently using a global VoiceMode and VoiceGlide.
    // IMPORTANT: If re-implementing, check that the settings are applied to the voice classes, currently everything is commentted out.
    property VoiceMode                : TVoiceMode                         read fVoiceMode               write SetVoiceMode;
    property VoiceGlide               : single                             read fVoiceGlide              write SetVoiceGlide;
  public
    constructor Create(const aVoices:PArrayOfLucidityVoice; const aOwningSampleGroup : IKeyGroup);
    destructor Destroy; override;

    procedure UpdateModConnections;

    procedure AssignFrom(const Source : TLucidityVoiceParameterWrapper);

    procedure ApplyParametersToVoice(aVoice : TLucidityVoice);
    
  published
    property PitchTracking            : TPitchTracking                     read fPitchTracking           write SetPitchTracking;
    property SamplePlaybackType       : TSamplePlaybackType                read fSamplePlaybackType      write SetSamplePlaybackType;
    property SampleReset              : TClockSource                       read fSampleReset             write SetSampleReset;
    property VoiceGain                : single                             read fVoiceGain               write SetVoiceGain;
    property VoicePan                 : single                             read fVoicePan                write SetVoicePan;
    property VoicePitchOne            : single                             read fVoicePitchOne           write SetVoicePitchOne; //range -1..1
    property VoicePitchTwo            : single                             read fVoicePitchTwo           write SetVoicePitchTwo; //range -1..1

    property GrainLoop                : TGrainStretchLoopMode              read fGrainLoop               write SetGrainLoop;
    property GrainLength              : single                             read fGrainLength             write SetGrainLength;
    property GrainRate                : single                             read fGrainRate               write SetGrainRate;
    property GrainPosition            : single                             read fGrainPosition           write SetGrainPosition;

    property SamplerLoopBounds        : TSamplerLoopBounds                 read fSamplerLoopBounds       write SetSampleLoopBounds;
    property SamplerLoopMode          : TKeyGroupTriggerMode                   read fSamplerLoopMode         write SetSamplerLoopMode;

    property MixAuxA                  : single                             read fMixAuxA                 write SetMixAuxA;
    property MixAuxB                  : single                             read fMixAuxB                 write SetMixAuxB;

    property OscShape                 : single                             read fOscShape                write SetOscShape;
    property OscPulseWidth            : single                             read fOscPulseWidth           write SetOscPulseWidth;
    property FilterRouting            : TFilterRouting                     read fFilterRouting           write SetFilterRouting;
    property Filter1Type              : TFilterType                        read fFilter1Type             write SetFilter1Type;
    property Filter2Type              : TFilterType                        read fFilter2Type             write SetFilter2Type;
    property Filter1KeyFollow         : single                             read fFilter1KeyFollow        write SetFilter1KeyFollow; //range 0..1
    property Filter2KeyFollow         : single                             read fFilter2KeyFollow        write SetFilter2KeyFollow; //range 0..1
    property Filter1Par1              : single                             read fFilter1Par1             write SetFilter1Par1;
    property Filter1Par2              : single                             read fFilter1Par2             write SetFilter1Par2;
    property Filter1Par3              : single                             read fFilter1Par3             write SetFilter1Par3;
    property Filter1Par4              : single                             read fFilter1Par4             write SetFilter1Par4;
    property Filter2Par1              : single                             read fFilter2Par1             write SetFilter2Par1;
    property Filter2Par2              : single                             read fFilter2Par2             write SetFilter2Par2;
    property Filter2Par3              : single                             read fFilter2Par3             write SetFilter2Par3;
    property Filter2Par4              : single                             read fFilter2Par4             write SetFilter2Par4;
    property AmpVelocityDepth         : TEnvVelocityDepth                  read fAmpVelocityDepth        write SetAmpVelocityDepth;

    //TODO:HIGH refactor these to ModAttack...
    property ModAttack                : single                             read fModAttack               write SetModAttack;
    property ModHold                  : single                             read fModHold                 write SetModHold;
    property ModDecay                 : single                             read fModDecay                write SetModDecay;
    property ModSustain               : single                             read fModSustain              write SetModSustain;
    property ModRelease               : single                             read fModRelease              write SetModRelease;
    property ModVelocityDepth         : TEnvVelocityDepth                  read fModVelocityDepth        write SetModVelocityDepth;
    property LfoShape1                : TLfoShape                          read fLfoShape1               write SetLfoShape1;
    property LfoShape2                : TLfoShape                          read fLfoShape2               write SetLfoShape2;
    property LfoFreqMode1             : TLfoFreqMode                       read fLfoFreqMode1            write SetLfoFreqMode1;
    property LfoFreqMode2             : TLfoFreqMode                       read fLfoFreqMode2            write SetLfoFreqMode2;
    property LfoRange1                : TLfoRange                          read fLfoRange1               write SetLfoRange1;
    property LfoRange2                : TLfoRange                          read fLfoRange2               write SetLfoRange2;

    //TODO: I don't know if these parameter wrapped values are required any more.
    property LfoRate1                 : single                             read fLfoRate1                write SetLfoRate1;
    property LfoRate2                 : single                             read fLfoRate2                write SetLfoRate2;
    property LfoAPar2                 : single                             read fLfoAPar2                write SetLfoAPar2;
    property LfoAPar3                 : single                             read fLfoAPar3                write SetLfoAPar3;
    property LfoBPar2                 : single                             read fLfoBPar2                write SetLfoBPar2;
    property LfoBPar3                 : single                             read fLfoBPar3                write SetLfoBPar3;
    property Seq1Clock                : TSequencerClock                    read fSeq1Clock               write SetSeq1Clock;
    property Seq1Direction            : TStepSequencerDirection            read fSeq1Direction           write SetSeq1Direction;
    property StepSeq1Length           : TStepSequencerLength               read fStepSeq1Length          write SetStepSeq1Length;
    property Seq2Clock                : TSequencerClock                    read fSeq2Clock               write SetSeq2Clock;
    property Seq2Direction            : TStepSequencerDirection            read fSeq2Direction           write SetSeq2Direction;
    property StepSeq2Length           : TStepSequencerLength               read fStepSeq2Length          write SetStepSeq2Length;


  end;

implementation

uses
  SysUtils, System.TypInfo,
  Lucidity.Types;


{ TLucidityEngineParameterWrapper }

constructor TLucidityVoiceParameterWrapper.Create(const aVoices:PArrayOfLucidityVoice; const aOwningSampleGroup : IKeyGroup);
begin
  OwningSampleGroup := Pointer(aOwningSampleGroup);
  VoiceCount := uConstants.kMaxVoiceCount;
  Voices := aVoices;

  self.fVoiceGain := 1;
  self.fVoicePan  := 0.5;
end;

destructor TLucidityVoiceParameterWrapper.Destroy;
begin
  OwningSampleGroup := nil;
  inherited;
end;




procedure TLucidityVoiceParameterWrapper.UpdateActiveVoices(UpdateAction: TUpdateActionProcedure);
var
  c1 : integer;
  OwningID : TKeyGroupID;
begin
  // UpdateActiveVoices() takes uses an anonymous method.
  // The anonymous method specifies how the voice needs to be updated.
  // The UpdateActiveVoices() "applies the action" to individual voices.
  // This is another layer of complication, but it makes it possible
  // to change which voices actions are applied to by changing one
  // place in the code.
  for c1 := 0 to kMaxVoiceCount-1 do
  begin
    OwningID := IKeyGroup(OwningSampleGroup).GetID;
    if (Voices^[c1].IsActive) and (Voices^[c1].KeyGroupID = OwningID) then
    begin
      UpdateAction(@Voices^[c1]);
    end;
  end;
end;

procedure TLucidityVoiceParameterWrapper.UpdateModConnections;
begin
  UpdateActiveVoices(
    procedure(v:PLucidityVoice)
    begin
      v^.ModMatrix.UpdateModConnections;
    end
  );
end;

procedure TLucidityVoiceParameterWrapper.SetAmpVelocityDepth(const Value: TEnvVelocityDepth);
begin
  fAmpVelocityDepth := Value;

  UpdateActiveVoices(
    procedure(v:PLucidityVoice)
    begin
      v^.AmpEnv.VelocityDepth := Value;
    end
  );
end;

procedure TLucidityVoiceParameterWrapper.SetFilter1Par1(const Value: single);
begin
  fFilter1Par1 := Value;
end;

procedure TLucidityVoiceParameterWrapper.SetFilter1Par2(const Value: single);
begin
  fFilter1Par2 := Value;
end;

procedure TLucidityVoiceParameterWrapper.SetFilter1Par3(const Value: single);
begin
  fFilter1Par3 := Value;
end;

procedure TLucidityVoiceParameterWrapper.SetFilter1Par4(const Value: single);
begin
  fFilter1Par4 := Value;
end;

procedure TLucidityVoiceParameterWrapper.SetFilter1Type(const Value: TFilterType);
begin
  fFilter1Type := Value;

  UpdateActiveVoices(
    procedure(v:PLucidityVoice)
    begin
      v^.FilterOne.FilterType := Value;
    end
  );
end;

procedure TLucidityVoiceParameterWrapper.SetFilter1KeyFollow(const Value: single);
begin
  assert(Value >= 0);
  assert(Value <= 1);

  fFilter1KeyFollow := Value;

  UpdateActiveVoices(
    procedure(v:PLucidityVoice)
    begin
      v^.FilterOne.KeyFollow := Value;
    end
  );
end;

procedure TLucidityVoiceParameterWrapper.SetFilter2KeyFollow(const Value: single);
begin
  assert(Value >= 0);
  assert(Value <= 1);

  fFilter2KeyFollow := Value;

  UpdateActiveVoices(
    procedure(v:PLucidityVoice)
    begin
      v^.FilterTwo.KeyFollow := Value;
    end
  );
end;

procedure TLucidityVoiceParameterWrapper.SetFilter2Par1(const Value: single);
begin
  fFilter2Par1 := Value;
end;

procedure TLucidityVoiceParameterWrapper.SetFilter2Par2(const Value: single);
begin
  fFilter2Par2 := Value;
end;

procedure TLucidityVoiceParameterWrapper.SetFilter2Par3(const Value: single);
begin
  fFilter2Par3 := Value;
end;

procedure TLucidityVoiceParameterWrapper.SetFilter2Par4(const Value: single);
begin
  fFilter2Par4 := Value;
end;

procedure TLucidityVoiceParameterWrapper.SetFilter2Type(const Value: TFilterType);
begin
  fFilter2Type := Value;

  UpdateActiveVoices(
    procedure(v:PLucidityVoice)
    begin
      v^.FilterTwo.FilterType := Value;
    end
  );
end;

procedure TLucidityVoiceParameterWrapper.SetModAttack(const Value: single);
begin
  fModAttack := Value;
end;

procedure TLucidityVoiceParameterWrapper.SetModDecay(const Value: single);
begin
  fModDecay := Value;
end;

procedure TLucidityVoiceParameterWrapper.SetModHold(const Value: single);
begin
  fModHold := Value;
end;

procedure TLucidityVoiceParameterWrapper.SetModRelease(const Value: single);
begin
  fModRelease := Value;
end;

procedure TLucidityVoiceParameterWrapper.SetFilterRouting(const Value: TFilterRouting);
begin
  fFilterRouting := Value;

  UpdateActiveVoices(
    procedure(v:PLucidityVoice)
    begin
      v^.FilterRouting := Value;
    end
  );
end;

procedure TLucidityVoiceParameterWrapper.SetModSustain(const Value: single);
begin
  fModSustain := Value;
end;

procedure TLucidityVoiceParameterWrapper.SetModVelocityDepth(const Value: TEnvVelocityDepth);
begin
  fModVelocityDepth := Value;

  UpdateActiveVoices(
    procedure(v:PLucidityVoice)
    begin
      v^.FilterEnv.VelocityDepth := Value;
    end
  );
end;

procedure TLucidityVoiceParameterWrapper.SetGrainLength(const Value: single);
begin
  fGrainLength := Value;

  UpdateActiveVoices(
    procedure(v:PLucidityVoice)
    begin
      v^.GrainStretchOsc.GrainLength := Value;
    end
  );
end;

procedure TLucidityVoiceParameterWrapper.SetGrainLoop(const Value: TGrainStretchLoopMode);
begin
  fGrainLoop := Value;

  UpdateActiveVoices(
    procedure(v:PLucidityVoice)
    begin
      v^.GrainStretchOsc.LoopMode := Value;
    end
  );
end;


procedure TLucidityVoiceParameterWrapper.SetGrainPosition(const Value: single);
begin
  fGrainPosition := Value;

  UpdateActiveVoices(
    procedure(v:PLucidityVoice)
    begin
      v^.GrainStretchOsc.GrainPosition := Value;
    end
  );
end;

procedure TLucidityVoiceParameterWrapper.SetGrainRate(const Value: single);
begin
  fGrainRate := Value;

  UpdateActiveVoices(
    procedure(v:PLucidityVoice)
    begin
      v^.GrainStretchOsc.GrainRate := Value;
    end
  );
end;

procedure TLucidityVoiceParameterWrapper.SetLfoAPar2(const Value: single);
begin
  fLfoAPar2 := Value;
end;

procedure TLucidityVoiceParameterWrapper.SetLfoAPar3(const Value: single);
begin
  fLfoAPar3 := Value;
end;

procedure TLucidityVoiceParameterWrapper.SetLfoBPar2(const Value: single);
begin
  fLfoBPar2 := Value;
end;

procedure TLucidityVoiceParameterWrapper.SetLfoBPar3(const Value: single);
begin
  fLfoBPar3 := Value;
end;

procedure TLucidityVoiceParameterWrapper.SetLfoFreqMode1(const Value: TLfoFreqMode);
begin
  fLfoFreqMode1 := Value;

  UpdateActiveVoices(
    procedure(v:PLucidityVoice)
    begin
      v^.LfoA.FreqMode := Value;
    end
  );
end;

procedure TLucidityVoiceParameterWrapper.SetLfoFreqMode2(const Value: TLfoFreqMode);
begin
  fLfoFreqMode2 := Value;

  UpdateActiveVoices(
    procedure(v:PLucidityVoice)
    begin
      v^.LfoB.FreqMode := Value;
    end
  );
end;

procedure TLucidityVoiceParameterWrapper.SetLfoRange1(const Value: TLfoRange);
begin
  fLfoRange1 := Value;

  UpdateActiveVoices(
    procedure(v:PLucidityVoice)
    begin
      v^.LfoA.Range := Value;
    end
  );
end;

procedure TLucidityVoiceParameterWrapper.SetLfoRange2(const Value: TLfoRange);
begin
  fLfoRange2 := Value;

  UpdateActiveVoices(
    procedure(v:PLucidityVoice)
    begin
      v^.LfoB.Range := Value;
    end
  );
end;

procedure TLucidityVoiceParameterWrapper.SetLfoRate1(const Value: single);
begin
  fLfoRate1 := Value;
end;

procedure TLucidityVoiceParameterWrapper.SetLfoRate2(const Value: single);
begin
  fLfoRate2 := Value;
end;

procedure TLucidityVoiceParameterWrapper.SetLfoShape1(const Value: TLfoShape);
begin
  fLfoShape1 := Value;

  UpdateActiveVoices(
    procedure(v:PLucidityVoice)
    begin
      v^.LfoA.Shape := Value;
    end
  );
end;

procedure TLucidityVoiceParameterWrapper.SetLfoShape2(const Value: TLfoShape);
begin
  fLfoShape2 := Value;

  UpdateActiveVoices(
    procedure(v:PLucidityVoice)
    begin
      v^.LfoB.Shape := Value;
    end
  );
end;

procedure TLucidityVoiceParameterWrapper.SetSampleLoopBounds(const Value: TSamplerLoopBounds);
begin
  fSamplerLoopBounds := Value;

  UpdateActiveVoices(
    procedure(v:PLucidityVoice)
    begin
      v^.OneShotSampleOsc.LoopBounds := Value;
      v^.LoopSampleOsc.LoopBounds := Value;
    end
  );
end;

procedure TLucidityVoiceParameterWrapper.SetOscPulseWidth(const Value: single);
begin
  fOscPulseWidth := Value;

  UpdateActiveVoices(
    procedure(v:PLucidityVoice)
    begin
      v^.WaveOsc.PulseWidth := Value;
    end
  );
end;

procedure TLucidityVoiceParameterWrapper.SetOscShape(const Value: single);
begin
  fOscShape := Value;

  UpdateActiveVoices(
    procedure(v:PLucidityVoice)
    begin
      v^.WaveOsc.Shape := Value;
    end
  );
end;




procedure TLucidityVoiceParameterWrapper.SetPitchTracking(const Value: TPitchTracking);
begin
  fPitchTracking := Value;


  // NOTE: Don't update the PitchTracking for active voices.
  // UpdateActiveVoices(
  //   procedure(v:PLucidityVoice)
  //   begin
  //     v^.PitchTracking := Value;
  //   end
  // );
end;

procedure TLucidityVoiceParameterWrapper.SetSamplePlaybackType(const Value: TSamplePlaybackType);
begin
  case Value of
    TSamplePlaybackType.NoteSampler:    fSamplePlaybackType := Value;
    TSamplePlaybackType.LoopSampler:    fSamplePlaybackType := Value;
    TSamplePlaybackType.OneShotSampler: fSamplePlaybackType := Value;
    TSamplePlaybackType.GrainStretch:   fSamplePlaybackType := TSamplePlaybackType.NoteSampler;
    TSamplePlaybackType.WaveOsc:        fSamplePlaybackType := TSamplePlaybackType.NoteSampler;
  else
    raise Exception.Create('Unexpected Sample Playback type.');
  end;


  // NOTE: Don't update the SamplePlaybackType for active voices.
  //UpdateActiveVoices(
  //  procedure(v:PLucidityVoice)
  //  begin
  //    v^.SampleOscType := Value;
  //  end
  //);
end;

procedure TLucidityVoiceParameterWrapper.SetSampleReset(Value: TClockSource);
begin
  if Value = TClockSource.SampleLoop
    then Value := TClockSource.None;

  fSampleReset := Value;

  UpdateActiveVoices(
    procedure(v:PLucidityVoice)
    begin
      v^.SampleReset := Value;
    end
  );
end;

procedure TLucidityVoiceParameterWrapper.SetSamplerLoopMode(const Value: TKeyGroupTriggerMode);
begin
  fSamplerLoopMode := Value;

  UpdateActiveVoices(
    procedure(v:PLucidityVoice)
    begin
      v^.LoopMode := Value;
    end
  );
end;

procedure TLucidityVoiceParameterWrapper.SetSeq1Clock(const Value: TSequencerClock);
begin
  fSeq1Clock := Value;

  UpdateActiveVoices(
    procedure(v:PLucidityVoice)
    begin
      v^.StepSeqOne.Clock := Value;
    end
  );
end;

procedure TLucidityVoiceParameterWrapper.SetSeq1Direction(const Value: TStepSequencerDirection);
begin
  fSeq1Direction := Value;

  UpdateActiveVoices(
    procedure(v:PLucidityVoice)
    begin
      v^.StepSeqOne.Direction := Value;
    end
  );
end;

procedure TLucidityVoiceParameterWrapper.SetSeq2Clock(const Value: TSequencerClock);
begin
  fSeq2Clock := Value;

  UpdateActiveVoices(
    procedure(v:PLucidityVoice)
    begin
      v^.StepSeqTwo.Clock := Value;
    end
  );
end;

procedure TLucidityVoiceParameterWrapper.SetSeq2Direction(const Value: TStepSequencerDirection);
begin
  fSeq2Direction := Value;

  UpdateActiveVoices(
    procedure(v:PLucidityVoice)
    begin
      v^.StepSeqTwo.Direction := Value;
    end
  );
end;


procedure TLucidityVoiceParameterWrapper.SetStepSeq1Length(const Value: TStepSequencerLength);
begin
  fStepSeq1Length := Value;

  UpdateActiveVoices(
    procedure(v:PLucidityVoice)
    begin
      v^.StepSeqOne.StepCount := Value;
    end
  );
end;

procedure TLucidityVoiceParameterWrapper.SetStepSeq2Length(const Value: TStepSequencerLength);
begin
  fStepSeq2Length := Value;

  UpdateActiveVoices(
    procedure(v:PLucidityVoice)
    begin
      v^.StepSeqTwo.StepCount := Value;
    end
  );
end;

procedure TLucidityVoiceParameterWrapper.SetVoiceGain(const Value: single);
begin
  fVoiceGain := Value;
end;

procedure TLucidityVoiceParameterWrapper.SetVoiceGlide(const Value: single);
begin
  fVoiceGlide := Value;

  UpdateActiveVoices(
    procedure(v:PLucidityVoice)
    begin
      //v^.VoiceGlide := Value;
    end
  );
end;

procedure TLucidityVoiceParameterWrapper.SetVoiceMode(const Value: TVoiceMode);
begin
  fVoiceMode := Value;

  UpdateActiveVoices(
    procedure(v:PLucidityVoice)
    begin
      //v^.VoiceMode := Value;
    end
  );
end;

procedure TLucidityVoiceParameterWrapper.SetVoicePan(const Value: single);
begin
  fVoicePan := Value;
end;

procedure TLucidityVoiceParameterWrapper.SetVoicePitchOne(const Value: single);
begin
  fVoicePitchOne := Value;
end;

procedure TLucidityVoiceParameterWrapper.SetVoicePitchTwo(const Value: single);
begin
  fVoicePitchTwo := Value;
end;

procedure TLucidityVoiceParameterWrapper.SetMixAuxA(const Value: single);
begin
  fMixAuxA := Value;

  UpdateActiveVoices(
    procedure(v:PLucidityVoice)
    begin
      v^.OutputMixer.VoiceMixAuxA := Value;
    end
  );
end;

procedure TLucidityVoiceParameterWrapper.SetMixAuxB(const Value: single);
begin
  fMixAuxB := Value;

  UpdateActiveVoices(
    procedure(v:PLucidityVoice)
    begin
      v^.OutputMixer.VoiceMixAuxB := Value;
    end
  );
end;

procedure TLucidityVoiceParameterWrapper.AssignFrom(const Source: TLucidityVoiceParameterWrapper);
begin
  //self.VoiceMode                := Source.VoiceMode;
  //self.VoiceGlide               := Source.VoiceGlide;

  self.PitchTracking            := Source.PitchTracking;
  self.SamplePlaybackType       := Source.SamplePlaybackType;
  self.SampleReset              := Source.SampleReset;

  Self.GrainLoop                := Source.GrainLoop;
  Self.GrainLength              := Source.GrainLength;
  Self.GrainRate                := Source.GrainRate;
  Self.GrainPosition            := Source.GrainPosition;

  self.SamplerLoopBounds        := Source.SamplerLoopBounds;
  self.SamplerLoopMode          := Source.SamplerLoopMode;

  self.MixAuxA                  := Source.MixAuxA;
  self.MixAuxB                  := Source.MixAuxB;

  Self.OscShape                 := Source.OscShape;
  Self.OscPulseWidth            := Source.OscPulseWidth;
  Self.VoiceGain                := Source.VoiceGain;
  Self.VoicePan                 := Source.VoicePan;
  Self.VoicePitchOne            := Source.VoicePitchOne;
  Self.VoicePitchTwo            := Source.VoicePitchTwo;
  Self.FilterRouting            := Source.FilterRouting;
  Self.Filter1Type              := Source.Filter1Type;
  Self.Filter2Type              := Source.Filter2Type;
  Self.Filter1KeyFollow         := Source.Filter1KeyFollow;
  Self.Filter2KeyFollow         := Source.Filter2KeyFollow;
  Self.Filter1Par1              := Source.Filter1Par1;
  Self.Filter1Par2              := Source.Filter1Par2;
  Self.Filter1Par3              := Source.Filter1Par3;
  Self.Filter1Par4              := Source.Filter1Par4;
  Self.Filter2Par1              := Source.Filter2Par1;
  Self.Filter2Par2              := Source.Filter2Par2;
  Self.Filter2Par3              := Source.Filter2Par3;
  Self.Filter2Par4              := Source.Filter2Par4;
  Self.AmpVelocityDepth         := Source.AmpVelocityDepth;
  Self.ModAttack             := Source.ModAttack;
  Self.ModHold               := Source.ModHold;
  Self.ModDecay              := Source.ModDecay;
  Self.ModSustain            := Source.ModSustain;
  Self.ModRelease            := Source.ModRelease;
  Self.ModVelocityDepth      := Source.ModVelocityDepth;
  Self.LfoShape1                := Source.LfoShape1;
  Self.LfoShape2                := Source.LfoShape2;
  Self.LfoFreqMode1             := Source.LfoFreqMode1;
  Self.LfoFreqMode2             := Source.LfoFreqMode2;
  Self.LfoRange1                := Source.LfoRange1;
  Self.LfoRange2                := Source.LfoRange2;
  Self.LfoRate1                 := Source.LfoRate1;
  Self.LfoRate2                 := Source.LfoRate2;
  self.LfoAPar2                 := Source.LfoAPar2;
  self.LfoBPar2                 := Source.LfoBPar2;
  Self.Seq1Clock                := Source.Seq1Clock;
  Self.Seq1Direction            := Source.Seq1Direction;
  Self.StepSeq1Length           := Source.StepSeq1Length;
  Self.Seq2Clock                := Source.Seq2Clock;
  Self.Seq2Direction            := Source.Seq2Direction;
  Self.StepSeq2Length           := Source.StepSeq2Length;
end;

procedure TLucidityVoiceParameterWrapper.ApplyParametersToVoice(aVoice: TLucidityVoice);
begin
  //=== set all one-to-one properties.====
  //aVoice.VoiceMode                       := VoiceMode;
  //aVoice.VoiceGlide                      := VoiceGlide;

  aVoice.PitchTracking                   := PitchTracking;
  aVoice.SamplePlaybackType              := SamplePlayBackType;
  aVoice.SampleReset                     := SampleReset;

  aVoice.GrainStretchOsc.LoopMode        := GrainLoop;
  aVoice.GrainStretchOsc.GrainLength     := GrainLength;
  aVoice.GrainStretchOsc.GrainRate       := GrainRate;
  aVoice.GrainStretchOsc.GrainPosition   := GrainPosition;

  aVoice.OneShotSampleOsc.LoopBounds     := SamplerLoopBounds;
  aVoice.LoopSampleOsc.LoopBounds        := SamplerLoopBounds;

  aVoice.LoopMode                        := SamplerLoopMode;

  aVoice.OutputMixer.VoiceMixAuxA        := MixAuxA;
  aVoice.OutputMixer.VoiceMixAuxB        := MixAuxB;
  aVoice.WaveOsc.Shape                   := OscShape;
  aVoice.WaveOsc.PulseWidth              := OscPulseWidth;
  //aVoice.SampleOsc.FmAmount := OscFm;  //!! what's going on here. duplicated parameters again?
  //aVoice.SampleOsc.AmAmount := OscAm;  //!! what's going on here. duplicated parameters again?
  //aVoice.StepSeq1Clock := ClockDivisionA; //I don't think this is needed.
  //aVoice.StepSeq2Clock := ClockDivisionB; //I don't think this is needed.
  aVoice.FilterRouting                   := FilterRouting;
  aVoice.FilterOne.FilterType            := Filter1Type;
  aVoice.FilterTwo.FilterType            := Filter2Type;
  aVoice.FilterOne.KeyFollow             := Filter1KeyFollow;
  aVoice.FilterTwo.KeyFollow             := Filter2KeyFollow;
  aVoice.AmpEnv.VelocityDepth            := AmpVelocityDepth;
  aVoice.FilterEnv.VelocityDepth         := ModVelocityDepth;
  aVoice.LfoA.Shape                      := LfoShape1;
  aVoice.LfoB.Shape                      := LfoShape2;
  aVoice.LfoA.FreqMode                   := LfoFreqMode1;
  aVoice.LfoB.FreqMode                   := LfoFreqMode2;
  aVoice.LfoA.Range                      := LfoRange1;
  aVoice.LfoB.Range                      := LfoRange2;
  aVoice.StepSeqOne.Clock                := Seq1Clock;
  aVoice.StepSeqOne.Direction            := Seq1Direction;
  aVoice.StepSeqOne.StepCount            := StepSeq1Length;
  aVoice.StepSeqTwo.Clock                := Seq2Clock;
  aVoice.StepSeqTwo.Direction            := Seq2Direction;
  aVoice.StepSeqTwo.StepCount            := StepSeq2Length;
end;






end.

