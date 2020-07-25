program Pfix1A;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, SysUtils, CustApp
  { you can add units after this };

type

  { Fix1A }

  Fix1A = class(TCustomApplication)
  protected
    procedure DoRun; override;
  public
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;
    procedure WriteHelp; virtual;
  end;

{ Fix1A }

procedure Fix1A.DoRun;
var
  ErrorMsg: String;
begin
  // quick check parameters
  ErrorMsg:=CheckOptions('h', 'help');
  if ErrorMsg<>'' then begin
    ShowException(Exception.Create(ErrorMsg));
    Terminate;
    Exit;
  end;

  // parse parameters
  if HasOption('h', 'help') then begin
    WriteHelp;
    Terminate;
    Exit;
  end;

  { add your program here }
   with TstringList.Create do
   begin
        LoadFromFile(ParamStr(1));
        if (trim(strings[count-1])='') then
           TFileStream.Create(ParamStr(1),fmCreate).write(Pointer(trim(Text))^,length(trim(Text)));
   end;
   Terminate;
end;

constructor Fix1A.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  StopOnException:=True;
end;

destructor Fix1A.Destroy;
begin
  inherited Destroy;
end;

procedure Fix1A.WriteHelp;
begin
  { add your help code here }
  writeln('Usage: ', ExeName, ' -h');
end;

var
  Application: Fix1A;
begin
  Application:=Fix1A.Create(nil);
  Application.Title:='Fix1A';
  Application.Run;
  Application.Free;
end.

