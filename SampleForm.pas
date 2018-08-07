unit SampleForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMlStdCtrl, uMlSkinForm,
  uMlSkinNCCtrlBase, uMlSkinNCButton;

type
  TWaryForm = class(TForm)
    MlSkinForm1: TMlSkinForm;
    MlSkinSystemButton1: TMlSkinSystemButton;
    MlSkinSystemButton2: TMlSkinSystemButton;
    MlSkinSystemButton3: TMlSkinSystemButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
