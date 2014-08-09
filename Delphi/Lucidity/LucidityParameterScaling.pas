unit LucidityParameterScaling;

interface

uses
  Math;

type
  // TParScaler is a class to centralise converting
  // from 0..1 VST parameter range to the target parameter range.
  TParScaler = class
  private
  public
    class function ADSR_AttackTimeToMS(const Value:single):single;
    class function ADSR_HoldTimeToMS(const Value:single):single;
    class function ADSR_DecayTimeToMS(const Value:single):single;
    class function ADSR_ReleaseTimeToMS(const Value:single):single;


    class function ModEnv_StageTimeToMS(const Value:single):single; //TODO:MED this should eventually be deleted.

  end;

implementation

uses
  eeFunctions, eeVirtualCV;

{ TParScaler }

class function TParScaler.ADSR_AttackTimeToMS(const Value: single): single;
begin
  assert((Value >= 0) and (Value <= 1));
  result := StaggeredExpand((Value * Value), 0,500,3000,8000);
end;

class function TParScaler.ADSR_HoldTimeToMS(const Value: single): single;
begin
  assert((Value >= 0) and (Value <= 1));
  result := Value * Value * 500;
end;

class function TParScaler.ADSR_DecayTimeToMS(const Value: single): single;
begin
  assert((Value >= 0) and (Value <= 1));
  result := StaggeredExpand((Value * Value), 6,500,3000,8000);
end;



class function TParScaler.ADSR_ReleaseTimeToMS(const Value: single): single;
begin
  assert((Value >= 0) and (Value <= 1));
  result := StaggeredExpand((Value * Value), 6,500,3000,8000);
end;

end.
