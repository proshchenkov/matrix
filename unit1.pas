unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, ExtCtrls,
  StdCtrls, Spin;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Panel1: TPanel;
    SpinEdit1: TSpinEdit;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    StringGrid3: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  i, j, k: integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.SpinEdit1Change(Sender: TObject);
begin
  StringGrid1.RowCount := SpinEdit1.Value;
  StringGrid1.ColCount := SpinEdit1.Value;
  StringGrid2.RowCount := SpinEdit1.Value;
  StringGrid2.ColCount := SpinEdit1.Value;
  StringGrid3.RowCount := SpinEdit1.Value;
  StringGrid3.ColCount := SpinEdit1.Value;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  for i := 0 to SpinEdit1.Value - 1 do
    for j := 0 to SpinEdit1.Value - 1 do
    begin
      StringGrid3.Cells[i, j] := '0';
      for k := 0 to SpinEdit1.Value - 1 do
        StringGrid3.Cells[i, j] :=
          (StringGrid3.Cells[i, j].ToInteger + StringGrid1.Cells[k, j].ToInteger *
          StringGrid2.Cells[i, k].ToInteger).ToString;
    end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  for i := 0 to SpinEdit1.Value - 1 do
  begin
    for j := 0 to SpinEdit1.Value - 1 do
    begin
      StringGrid3.Cells[i, j] :=
        (StringGrid1.Cells[i, j].ToInteger + StringGrid2.Cells[i, j].ToInteger).ToString;
    end;
  end;
end;

end.
