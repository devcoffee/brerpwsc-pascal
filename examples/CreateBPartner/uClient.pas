unit uClient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ButtonGroup,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, BrERPwscPascal, Soap.InvokeRegistry,
  Soap.Rio, Soap.SOAPHTTPClient;

type
  TForm1 = class(TForm)
    EditUser: TEdit;
    PanelLogin: TPanel;
    EditPass: TEdit;
    EditClientID: TEdit;
    EditRoleID: TEdit;
    EditOrgID: TEdit;
    EditStage: TEdit;
    EditWarehouseID: TEdit;
    EditLang: TEdit;
    LabelUser: TLabel;
    LabelLang: TLabel;
    LabelClientID: TLabel;
    LabelRoleID: TLabel;
    LabelOrgID: TLabel;
    LabelWarehouseID: TLabel;
    LabelStage: TLabel;
    ImageLogoBrERP: TImage;
    ImageMenu: TImage;
    BtnSave: TButton;
    BtnCancel: TButton;
    ImageHRMenu1: TImage;
    HTTPRIO1: THTTPRIO;
    ImageHRMenu2: TImage;
    EditBPName: TEdit;
    EditBPValue: TEdit;
    EditBPTaxID: TEdit;
    LabelBPName: TLabel;
    LabelBPValue: TLabel;
    LabelBPTaxID: TLabel;
    BtnSendRequest: TButton;
    Image1: TImage;
    EditURL: TEdit;
    procedure ImageMenuClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SetLogin();
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure HTTPRIO1AfterExecute(const MethodName: string;
      SOAPResponse: TStream);
    procedure HTTPRIO1BeforeExecute(const MethodName: string;
      SOAPRequest: TStream);
    procedure BtnSendRequestClick(Sender: TObject);
  private
    { Private declarations }
    ADLogin : ADLoginRequest;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses XMLIntf, XMLDoc;

//=== Set Login (ADLogin) ======================================================
procedure TForm1.SetLogin();
begin
  ADLogin.user        := EditUser.text;
  ADLogin.pass        := EditPass.text;
  ADLogin.lang        := EditLang.text;
  ADLogin.ClientID    := StrToInt(EditClientID.text);
  ADLogin.RoleID      := StrToInt(EditRoleID.text);
  ADLogin.OrgID       := StrToInt(EditOrgID.text);
  ADLogin.WarehouseID := StrToInt(EditWarehouseID.text);
  ADLogin.stage       := StrToInt(EditStage.text);
end;

//=== Cancel Button ============================================================
procedure TForm1.BtnCancelClick(Sender: TObject);
begin
  EditUser.text        := ADLogin.user;
  EditPass.text        := ADLogin.pass;
  EditLang.text        := ADLogin.lang;
  EditClientID.text    := IntToStr(ADLogin.ClientID);
  EditRoleID.text      := IntToStr(ADLogin.RoleID);
  EditOrgID.text       := IntToStr(ADLogin.OrgID);
  EditWarehouseID.text := IntToStr(ADLogin.WarehouseID );
  EditStage.text       := IntToStr(ADLogin.stage);
end;

//=== Save Button ==============================================================
procedure TForm1.BtnSaveClick(Sender: TObject);
begin
  SetLogin;
end;

//=== Send Request =============================================================
procedure TForm1.BtnSendRequestClick(Sender: TObject);
var
  arg0 : ModelCRUDRequest;
  tabData : WindowTabData;
  data : DataField;
  dataRow : BrERPwscPascal.DataRow;
begin
  arg0 := ModelCRUDRequest.Create;
  // Set Login to Model CRUD Request
  arg0.ADLoginRequest := ADLogin;

  // Set CRUD Model
  arg0.ModelCRUD.serviceType := 'CreateBPartnerTest';

  SetLength(dataRow,3);
  // Set sending Data
  data := DataField.Create;
  data.column := 'Name';
  data.val    := EditBPName.Text;
  DataRow[0]  := data;

  data.column := 'Value';
  data.val    := EditBPValue.Text;
  DataRow[1]  := data;

  data.column := 'TaxID';
  data.val    := EditBPTaxID.Text;
  DataRow[2]  := data;
  // Set Array of sending Data
  arg0.ModelCRUD.DataRow := dataRow;

  { Send Request, can be:
      GetModelADService().CallMethod
      GetModelADService(UseWSDL, URL, HTTPRio).CallMethod
          e.g. URL: 'http://teste.brerp.com.br'

    CallMethod can be
      createUpdateData(ModelCRUDRequest)
      setDocAction(ModelSetDocActionRequest)
      createData(ModelCRUDRequest)
      deleteData(ModelCRUDRequest)
      readData(ModelCRUDRequest)
      getList(ModelGetListRequest)
      runProcess(ModelRunProcessRequest)
      updateData(ModelCRUDRequest)
      queryData(ModelCRUDRequest)

    Return will be a WindowTabData
  }
  tabData := GetModelADService(true, EditURL.Text, HTTPRIO1).readData(arg0);

  ShowMessage(tabData.NumRows.ToString);
  ShowMessage(tabData.TotalRows.ToString);
  ShowMessage(tabData.StartRow.ToString);
  ShowMessage(tabData.RowCount.ToString);
  ShowMessage(tabData.Success.ToString);
  ShowMessage(tabData.Error);
  ShowMessage(tabData.ErrorInfo);
  ShowMessage(tabData.Status);

end;

//=== Form Create ==============================================================
procedure TForm1.FormCreate(Sender: TObject);
begin
  ADLogin := ADLoginRequest.Create;
  SetLogin;
end;

//=== After Send XML ===========================================================
procedure TForm1.HTTPRIO1AfterExecute(const MethodName: string;
  SOAPResponse: TStream);
var
  Document: IXMLDocument;
begin
  SOAPResponse.Position := 0;

  Document := TXMLDocument.Create(nil);
  Document.Options := [];
  Document.LoadFromStream(SOAPResponse);
  Document.XML.Text := xmlDoc.FormatXMLData(Document.XML.Text);
  Document.SaveToFile(ExtractFilePath(Application.ExeName) + '/../../../' +
        'documents/' + Application.ExeName + 'Test_Response.xml');

  SOAPResponse.Position := 0;
end;

//=== Before Send XML ==========================================================
procedure TForm1.HTTPRIO1BeforeExecute(const MethodName: string;
  SOAPRequest: TStream);
var
  Document: IXMLDocument;
begin
  SOAPRequest.Position := 0;

  Document := TXMLDocument.Create(nil);
  Document.Options := [];
  Document.LoadFromStream(SOAPRequest);
  Document.XML.Text := xmlDoc.FormatXMLData(Document.XML.Text);
  Document.SaveToFile(ExtractFilePath(Application.ExeName) + '/../../../' +
        'documents/' + Application.ExeName + 'Test_Request.xml');

  SOAPRequest.Position := 0;
end;

//=== Menu Button ==============================================================
procedure TForm1.ImageMenuClick(Sender: TObject);
var imagePath : String;
begin
  if PanelLogin.Left = 0 then
    begin // Close Menu
      imagePath := ExtractFilePath(Application.ExeName) + '/../../../' + 'Resources/MenuOpen.png';
      if (FileExists(imagePath)) then
        ImageMenu.Picture.LoadFromFile(imagePath);

      while(PanelLogin.Left > (-PanelLogin.Width)+40 ) do
        PanelLogin.Left := PanelLogin.Left-5
    end
  else
    begin // Open Menu
      imagePath := ExtractFilePath(Application.ExeName) + '/../../../' + 'Resources/MenuClose.png';
      if (FileExists(imagePath)) then
        ImageMenu.Picture.LoadFromFile(imagePath);

      while(PanelLogin.Left < 0) do
        PanelLogin.Left := PanelLogin.Left+5;
    end;
  end;

end.
