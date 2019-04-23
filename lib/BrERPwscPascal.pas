// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://teste.brerp.com.br/ADInterface/services/ModelADService?wsdl
//  >Import : http://teste.brerp.com.br/ADInterface/services/ModelADService?wsdl>0
// Version  : 1.0
// (15/04/2019 16:18:19 - - $Rev: 93209 $)
// ************************************************************************ //

unit BrERPwscPascal;

interface

uses Soap.InvokeRegistry, Soap.SOAPHTTPClient, System.Types, Soap.XSBuiltIns;

const
  IS_OPTN = $0001;
  IS_UNBD = $0002;
  IS_ATTR = $0010;


type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:hexBinary       - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:int             - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:boolean         - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]

  ModelCRUDRequest2    = class;                 { "http://idempiere.org/ADInterface/1_0"[GblCplx] }
  ModelCRUDRequest     = class;                 { "http://idempiere.org/ADInterface/1_0"[GblElm] }
  WindowTabData2       = class;                 { "http://idempiere.org/ADInterface/1_0"[GblCplx] }
  WindowTabData        = class;                 { "http://idempiere.org/ADInterface/1_0"[GblElm] }
  RunProcessResponse2  = class;                 { "http://idempiere.org/ADInterface/1_0"[GblCplx] }
  RunProcessResponse   = class;                 { "http://idempiere.org/ADInterface/1_0"[GblElm] }
  LookupValue          = class;                 { "http://idempiere.org/ADInterface/1_0"[GblCplx] }
  DataField            = class;                 { "http://idempiere.org/ADInterface/1_0"[GblCplx] }
  ADLoginRequest2      = class;                 { "http://idempiere.org/ADInterface/1_0"[GblCplx] }
  ADLoginRequest       = class;                 { "http://idempiere.org/ADInterface/1_0"[GblElm] }
  ModelRunProcessRequest2 = class;              { "http://idempiere.org/ADInterface/1_0"[GblCplx] }
  ModelRunProcessRequest = class;               { "http://idempiere.org/ADInterface/1_0"[GblElm] }
  ModelGetList         = class;                 { "http://idempiere.org/ADInterface/1_0"[GblCplx] }
  ModelGetListRequest2 = class;                 { "http://idempiere.org/ADInterface/1_0"[GblCplx] }
  ModelGetListRequest  = class;                 { "http://idempiere.org/ADInterface/1_0"[GblElm] }
  ModelCRUD            = class;                 { "http://idempiere.org/ADInterface/1_0"[GblCplx] }
  ModelRunProcess2     = class;                 { "http://idempiere.org/ADInterface/1_0"[GblCplx] }
  ModelRunProcess      = class;                 { "http://idempiere.org/ADInterface/1_0"[GblElm] }
  StandardResponse2    = class;                 { "http://idempiere.org/ADInterface/1_0"[GblCplx] }
  StandardResponse     = class;                 { "http://idempiere.org/ADInterface/1_0"[GblElm] }
  outputField          = class;                 { "http://idempiere.org/ADInterface/1_0"[GblCplx] }
  ModelSetDocAction    = class;                 { "http://idempiere.org/ADInterface/1_0"[GblCplx] }
  ModelSetDocActionRequest2 = class;            { "http://idempiere.org/ADInterface/1_0"[GblCplx] }
  ModelSetDocActionRequest = class;             { "http://idempiere.org/ADInterface/1_0"[GblElm] }

  {$SCOPEDENUMS ON}
  { "http://idempiere.org/ADInterface/1_0"[Smpl] }
  Action = (Create, Read_, Update, Delete, CreateUpdate);

  {$SCOPEDENUMS OFF}



  // ************************************************************************ //
  // XML       : ModelCRUDRequest, global, <complexType>
  // Namespace : http://idempiere.org/ADInterface/1_0
  // ************************************************************************ //
  ModelCRUDRequest2 = class(TRemotable)
  private
    FModelCRUD: ModelCRUD;
    FADLoginRequest: ADLoginRequest2;
  public
    constructor Create; reintroduce; overload;
    destructor Destroy; override;
  published
    property ModelCRUD:      ModelCRUD        read FModelCRUD write FModelCRUD;
    property ADLoginRequest: ADLoginRequest2  read FADLoginRequest write FADLoginRequest;
  end;



  // ************************************************************************ //
  // XML       : ModelCRUDRequest, global, <element>
  // Namespace : http://idempiere.org/ADInterface/1_0
  // ************************************************************************ //
  ModelCRUDRequest = class(ModelCRUDRequest2)
  private
  published
  end;

  LookupValues = array of LookupValue;          { "http://idempiere.org/ADInterface/1_0"[GblCplx] }
  DataRow    = array of DataField;              { "http://idempiere.org/ADInterface/1_0"[GblCplx] }
  DataSet    = array of DataRow;                { "http://idempiere.org/ADInterface/1_0"[GblCplx] }


  // ************************************************************************ //
  // XML       : WindowTabData, global, <complexType>
  // Namespace : http://idempiere.org/ADInterface/1_0
  // ************************************************************************ //
  WindowTabData2 = class(TRemotable)
  private
    FNumRows: Integer;
    FNumRows_Specified: boolean;
    FTotalRows: Integer;
    FTotalRows_Specified: boolean;
    FStartRow: Integer;
    FStartRow_Specified: boolean;
    FDataSet: DataSet;
    FDataSet_Specified: boolean;
    FRowCount: Integer;
    FRowCount_Specified: boolean;
    FSuccess: Boolean;
    FSuccess_Specified: boolean;
    FError: string;
    FError_Specified: boolean;
    FErrorInfo: string;
    FErrorInfo_Specified: boolean;
    FStatus: string;
    FStatus_Specified: boolean;
    FStatusError: Boolean;
    FStatusError_Specified: boolean;
    procedure SetNumRows(Index: Integer; const AInteger: Integer);
    function  NumRows_Specified(Index: Integer): boolean;
    procedure SetTotalRows(Index: Integer; const AInteger: Integer);
    function  TotalRows_Specified(Index: Integer): boolean;
    procedure SetStartRow(Index: Integer; const AInteger: Integer);
    function  StartRow_Specified(Index: Integer): boolean;
    procedure SetDataSet(Index: Integer; const ADataSet: DataSet);
    function  DataSet_Specified(Index: Integer): boolean;
    procedure SetRowCount(Index: Integer; const AInteger: Integer);
    function  RowCount_Specified(Index: Integer): boolean;
    procedure SetSuccess(Index: Integer; const ABoolean: Boolean);
    function  Success_Specified(Index: Integer): boolean;
    procedure SetError(Index: Integer; const Astring: string);
    function  Error_Specified(Index: Integer): boolean;
    procedure SetErrorInfo(Index: Integer; const Astring: string);
    function  ErrorInfo_Specified(Index: Integer): boolean;
    procedure SetStatus(Index: Integer; const Astring: string);
    function  Status_Specified(Index: Integer): boolean;
    procedure SetStatusError(Index: Integer; const ABoolean: Boolean);
    function  StatusError_Specified(Index: Integer): boolean;
  published
    property NumRows:     Integer  Index (IS_ATTR or IS_OPTN) read FNumRows write SetNumRows stored NumRows_Specified;
    property TotalRows:   Integer  Index (IS_ATTR or IS_OPTN) read FTotalRows write SetTotalRows stored TotalRows_Specified;
    property StartRow:    Integer  Index (IS_ATTR or IS_OPTN) read FStartRow write SetStartRow stored StartRow_Specified;
    property DataSet:     DataSet  Index (IS_OPTN) read FDataSet write SetDataSet stored DataSet_Specified;
    property RowCount:    Integer  Index (IS_OPTN) read FRowCount write SetRowCount stored RowCount_Specified;
    property Success:     Boolean  Index (IS_OPTN) read FSuccess write SetSuccess stored Success_Specified;
    property Error:       string   Index (IS_OPTN) read FError write SetError stored Error_Specified;
    property ErrorInfo:   string   Index (IS_OPTN) read FErrorInfo write SetErrorInfo stored ErrorInfo_Specified;
    property Status:      string   Index (IS_OPTN) read FStatus write SetStatus stored Status_Specified;
    property StatusError: Boolean  Index (IS_OPTN) read FStatusError write SetStatusError stored StatusError_Specified;
  end;



  // ************************************************************************ //
  // XML       : WindowTabData, global, <element>
  // Namespace : http://idempiere.org/ADInterface/1_0
  // ************************************************************************ //
  WindowTabData = class(WindowTabData2)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : RunProcessResponse, global, <complexType>
  // Namespace : http://idempiere.org/ADInterface/1_0
  // ************************************************************************ //
  RunProcessResponse2 = class(TRemotable)
  private
    FIsError: Boolean;
    FIsError_Specified: boolean;
    FIsReport: Boolean;
    FIsReport_Specified: boolean;
    FReportFormat: string;
    FReportFormat_Specified: boolean;
    FError: string;
    FSummary: string;
    FLogInfo: string;
    FData: TXSHexBinary;
    procedure SetIsError(Index: Integer; const ABoolean: Boolean);
    function  IsError_Specified(Index: Integer): boolean;
    procedure SetIsReport(Index: Integer; const ABoolean: Boolean);
    function  IsReport_Specified(Index: Integer): boolean;
    procedure SetReportFormat(Index: Integer; const Astring: string);
    function  ReportFormat_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property IsError:      Boolean       Index (IS_ATTR or IS_OPTN) read FIsError write SetIsError stored IsError_Specified;
    property IsReport:     Boolean       Index (IS_ATTR or IS_OPTN) read FIsReport write SetIsReport stored IsReport_Specified;
    property ReportFormat: string        Index (IS_ATTR or IS_OPTN) read FReportFormat write SetReportFormat stored ReportFormat_Specified;
    property Error:        string        read FError write FError;
    property Summary:      string        read FSummary write FSummary;
    property LogInfo:      string        read FLogInfo write FLogInfo;
    property Data:         TXSHexBinary  read FData write FData;
  end;



  // ************************************************************************ //
  // XML       : RunProcessResponse, global, <element>
  // Namespace : http://idempiere.org/ADInterface/1_0
  // ************************************************************************ //
  RunProcessResponse = class(RunProcessResponse2)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : LookupValue, global, <complexType>
  // Namespace : http://idempiere.org/ADInterface/1_0
  // ************************************************************************ //
  LookupValue = class(TRemotable)
  private
    Fval: string;
    Fval_Specified: boolean;
    Fkey: string;
    Fkey_Specified: boolean;
    procedure Setval(Index: Integer; const Astring: string);
    function  val_Specified(Index: Integer): boolean;
    procedure Setkey(Index: Integer; const Astring: string);
    function  key_Specified(Index: Integer): boolean;
  published
    property val: string  Index (IS_ATTR or IS_OPTN) read Fval write Setval stored val_Specified;
    property key: string  Index (IS_ATTR or IS_OPTN) read Fkey write Setkey stored key_Specified;
  end;



  // ************************************************************************ //
  // XML       : DataField, global, <complexType>
  // Namespace : http://idempiere.org/ADInterface/1_0
  // ************************************************************************ //
  DataField = class(TRemotable)
  private
    Ftype_: string;
    Ftype__Specified: boolean;
    Fcolumn: string;
    Fcolumn_Specified: boolean;
    Flval: string;
    Flval_Specified: boolean;
    Fdisp: Boolean;
    Fdisp_Specified: boolean;
    Fedit: Boolean;
    Fedit_Specified: boolean;
    Ferror: Boolean;
    Ferror_Specified: boolean;
    FerrorVal: string;
    FerrorVal_Specified: boolean;
    Fval: string;
    Flookup: LookupValues;
    Flookup_Specified: boolean;
    procedure Settype_(Index: Integer; const Astring: string);
    function  type__Specified(Index: Integer): boolean;
    procedure Setcolumn(Index: Integer; const Astring: string);
    function  column_Specified(Index: Integer): boolean;
    procedure Setlval(Index: Integer; const Astring: string);
    function  lval_Specified(Index: Integer): boolean;
    procedure Setdisp(Index: Integer; const ABoolean: Boolean);
    function  disp_Specified(Index: Integer): boolean;
    procedure Setedit(Index: Integer; const ABoolean: Boolean);
    function  edit_Specified(Index: Integer): boolean;
    procedure Seterror(Index: Integer; const ABoolean: Boolean);
    function  error_Specified(Index: Integer): boolean;
    procedure SeterrorVal(Index: Integer; const Astring: string);
    function  errorVal_Specified(Index: Integer): boolean;
    procedure Setlookup(Index: Integer; const ALookupValues: LookupValues);
    function  lookup_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property type_:    string        Index (IS_ATTR or IS_OPTN) read Ftype_ write Settype_ stored type__Specified;
    property column:   string        Index (IS_ATTR or IS_OPTN) read Fcolumn write Setcolumn stored column_Specified;
    property lval:     string        Index (IS_ATTR or IS_OPTN) read Flval write Setlval stored lval_Specified;
    property disp:     Boolean       Index (IS_ATTR or IS_OPTN) read Fdisp write Setdisp stored disp_Specified;
    property edit:     Boolean       Index (IS_ATTR or IS_OPTN) read Fedit write Setedit stored edit_Specified;
    property error:    Boolean       Index (IS_ATTR or IS_OPTN) read Ferror write Seterror stored error_Specified;
    property errorVal: string        Index (IS_ATTR or IS_OPTN) read FerrorVal write SeterrorVal stored errorVal_Specified;
    property val:      string        read Fval write Fval;
    property lookup:   LookupValues  Index (IS_OPTN) read Flookup write Setlookup stored lookup_Specified;
  end;



  // ************************************************************************ //
  // XML       : ADLoginRequest, global, <complexType>
  // Namespace : http://idempiere.org/ADInterface/1_0
  // ************************************************************************ //
  ADLoginRequest2 = class(TRemotable)
  private
    Fuser: string;
    Fpass: string;
    Flang: string;
    FClientID: Integer;
    FRoleID: Integer;
    FOrgID: Integer;
    FWarehouseID: Integer;
    Fstage: Integer;
  published
    property user:        string   read Fuser write Fuser;
    property pass:        string   read Fpass write Fpass;
    property lang:        string   read Flang write Flang;
    property ClientID:    Integer  read FClientID write FClientID;
    property RoleID:      Integer  read FRoleID write FRoleID;
    property OrgID:       Integer  read FOrgID write FOrgID;
    property WarehouseID: Integer  read FWarehouseID write FWarehouseID;
    property stage:       Integer  read Fstage write Fstage;
  end;



  // ************************************************************************ //
  // XML       : ADLoginRequest, global, <element>
  // Namespace : http://idempiere.org/ADInterface/1_0
  // ************************************************************************ //
  ADLoginRequest = class(ADLoginRequest2)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : ModelRunProcessRequest, global, <complexType>
  // Namespace : http://idempiere.org/ADInterface/1_0
  // ************************************************************************ //
  ModelRunProcessRequest2 = class(TRemotable)
  private
    FModelRunProcess: ModelRunProcess2;
    FADLoginRequest: ADLoginRequest2;
  public
    destructor Destroy; override;
  published
    property ModelRunProcess: ModelRunProcess2  read FModelRunProcess write FModelRunProcess;
    property ADLoginRequest:  ADLoginRequest2   read FADLoginRequest write FADLoginRequest;
  end;



  // ************************************************************************ //
  // XML       : ModelRunProcessRequest, global, <element>
  // Namespace : http://idempiere.org/ADInterface/1_0
  // ************************************************************************ //
  ModelRunProcessRequest = class(ModelRunProcessRequest2)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : ModelGetList, global, <complexType>
  // Namespace : http://idempiere.org/ADInterface/1_0
  // ************************************************************************ //
  ModelGetList = class(TRemotable)
  private
    FserviceType: string;
    FAD_Reference_ID: Integer;
    FFilter: string;
  published
    property serviceType:     string   read FserviceType write FserviceType;
    property AD_Reference_ID: Integer  read FAD_Reference_ID write FAD_Reference_ID;
    property Filter:          string   read FFilter write FFilter;
  end;



  // ************************************************************************ //
  // XML       : ModelGetListRequest, global, <complexType>
  // Namespace : http://idempiere.org/ADInterface/1_0
  // ************************************************************************ //
  ModelGetListRequest2 = class(TRemotable)
  private
    FModelGetList: ModelGetList;
    FADLoginRequest: ADLoginRequest2;
  public
    destructor Destroy; override;
  published
    property ModelGetList:   ModelGetList     read FModelGetList write FModelGetList;
    property ADLoginRequest: ADLoginRequest2  read FADLoginRequest write FADLoginRequest;
  end;



  // ************************************************************************ //
  // XML       : ModelGetListRequest, global, <element>
  // Namespace : http://idempiere.org/ADInterface/1_0
  // ************************************************************************ //
  ModelGetListRequest = class(ModelGetListRequest2)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : ModelCRUD, global, <complexType>
  // Namespace : http://idempiere.org/ADInterface/1_0
  // ************************************************************************ //
  ModelCRUD = class(TRemotable)
  private
    FserviceType: string;
    FTableName: string;
    FRecordID: Integer;
    FrecordIDVariable: string;
    FrecordIDVariable_Specified: boolean;
    FFilter: string;
    FFilter_Specified: boolean;
    FAction: Action;
    FOffset: Integer;
    FOffset_Specified: boolean;
    FLimit: Integer;
    FLimit_Specified: boolean;
    FDataRow: DataRow;
    FDataRow_Specified: boolean;
    procedure SetrecordIDVariable(Index: Integer; const Astring: string);
    function  recordIDVariable_Specified(Index: Integer): boolean;
    procedure SetFilter(Index: Integer; const Astring: string);
    function  Filter_Specified(Index: Integer): boolean;
    procedure SetOffset(Index: Integer; const AInteger: Integer);
    function  Offset_Specified(Index: Integer): boolean;
    procedure SetLimit(Index: Integer; const AInteger: Integer);
    function  Limit_Specified(Index: Integer): boolean;
    procedure SetDataRow(Index: Integer; const ADataRow: DataRow);
    function  DataRow_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property serviceType:      string   read FserviceType write FserviceType;
    property TableName:        string   read FTableName write FTableName;
    property RecordID:         Integer  read FRecordID write FRecordID;
    property recordIDVariable: string   Index (IS_OPTN) read FrecordIDVariable write SetrecordIDVariable stored recordIDVariable_Specified;
    property Filter:           string   Index (IS_OPTN) read FFilter write SetFilter stored Filter_Specified;
    property Action:           Action   read FAction write FAction;
    property Offset:           Integer  Index (IS_OPTN) read FOffset write SetOffset stored Offset_Specified;
    property Limit:            Integer  Index (IS_OPTN) read FLimit write SetLimit stored Limit_Specified;
    property DataRow:          DataRow  Index (IS_OPTN) read FDataRow write SetDataRow stored DataRow_Specified;
  end;



  // ************************************************************************ //
  // XML       : ModelRunProcess, global, <complexType>
  // Namespace : http://idempiere.org/ADInterface/1_0
  // ************************************************************************ //
  ModelRunProcess2 = class(TRemotable)
  private
    FAD_Process_ID: Integer;
    FAD_Process_ID_Specified: boolean;
    FAD_Menu_ID: Integer;
    FAD_Menu_ID_Specified: boolean;
    FAD_Record_ID: Integer;
    FAD_Record_ID_Specified: boolean;
    FDocAction: string;
    FDocAction_Specified: boolean;
    FserviceType: string;
    FParamValues: DataRow;
    procedure SetAD_Process_ID(Index: Integer; const AInteger: Integer);
    function  AD_Process_ID_Specified(Index: Integer): boolean;
    procedure SetAD_Menu_ID(Index: Integer; const AInteger: Integer);
    function  AD_Menu_ID_Specified(Index: Integer): boolean;
    procedure SetAD_Record_ID(Index: Integer; const AInteger: Integer);
    function  AD_Record_ID_Specified(Index: Integer): boolean;
    procedure SetDocAction(Index: Integer; const Astring: string);
    function  DocAction_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property AD_Process_ID: Integer  Index (IS_ATTR or IS_OPTN) read FAD_Process_ID write SetAD_Process_ID stored AD_Process_ID_Specified;
    property AD_Menu_ID:    Integer  Index (IS_ATTR or IS_OPTN) read FAD_Menu_ID write SetAD_Menu_ID stored AD_Menu_ID_Specified;
    property AD_Record_ID:  Integer  Index (IS_ATTR or IS_OPTN) read FAD_Record_ID write SetAD_Record_ID stored AD_Record_ID_Specified;
    property DocAction:     string   Index (IS_ATTR or IS_OPTN) read FDocAction write SetDocAction stored DocAction_Specified;
    property serviceType:   string   read FserviceType write FserviceType;
    property ParamValues:   DataRow  read FParamValues write FParamValues;
  end;



  // ************************************************************************ //
  // XML       : ModelRunProcess, global, <element>
  // Namespace : http://idempiere.org/ADInterface/1_0
  // ************************************************************************ //
  ModelRunProcess = class(ModelRunProcess2)
  private
  published
  end;

  outputFields = array of outputField;          { "http://idempiere.org/ADInterface/1_0"[GblCplx] }
  Array_Of_outputFields = array of outputFields;   { "http://idempiere.org/ADInterface/1_0"[GblUbnd] }


  // ************************************************************************ //
  // XML       : StandardResponse, global, <complexType>
  // Namespace : http://idempiere.org/ADInterface/1_0
  // ************************************************************************ //
  StandardResponse2 = class(TRemotable)
  private
    FIsError: Boolean;
    FIsError_Specified: boolean;
    FIsRolledBack: Boolean;
    FIsRolledBack_Specified: boolean;
    FRecordID: Integer;
    FRecordID_Specified: boolean;
    FError: string;
    FError_Specified: boolean;
    FoutputFields: Array_Of_outputFields;
    FoutputFields_Specified: boolean;
    FRunProcessResponse: RunProcessResponse2;
    FRunProcessResponse_Specified: boolean;
    FWindowTabData: WindowTabData2;
    FWindowTabData_Specified: boolean;
    procedure SetIsError(Index: Integer; const ABoolean: Boolean);
    function  IsError_Specified(Index: Integer): boolean;
    procedure SetIsRolledBack(Index: Integer; const ABoolean: Boolean);
    function  IsRolledBack_Specified(Index: Integer): boolean;
    procedure SetRecordID(Index: Integer; const AInteger: Integer);
    function  RecordID_Specified(Index: Integer): boolean;
    procedure SetError(Index: Integer; const Astring: string);
    function  Error_Specified(Index: Integer): boolean;
    procedure SetoutputFields(Index: Integer; const AArray_Of_outputFields: Array_Of_outputFields);
    function  outputFields_Specified(Index: Integer): boolean;
    procedure SetRunProcessResponse(Index: Integer; const ARunProcessResponse2: RunProcessResponse2);
    function  RunProcessResponse_Specified(Index: Integer): boolean;
    procedure SetWindowTabData(Index: Integer; const AWindowTabData2: WindowTabData2);
    function  WindowTabData_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property IsError:            Boolean                Index (IS_ATTR or IS_OPTN) read FIsError write SetIsError stored IsError_Specified;
    property IsRolledBack:       Boolean                Index (IS_ATTR or IS_OPTN) read FIsRolledBack write SetIsRolledBack stored IsRolledBack_Specified;
    property RecordID:           Integer                Index (IS_ATTR or IS_OPTN) read FRecordID write SetRecordID stored RecordID_Specified;
    property Error:              string                 Index (IS_OPTN) read FError write SetError stored Error_Specified;
    property outputFields:       Array_Of_outputFields  Index (IS_OPTN or IS_UNBD) read FoutputFields write SetoutputFields stored outputFields_Specified;
    property RunProcessResponse: RunProcessResponse2    Index (IS_OPTN) read FRunProcessResponse write SetRunProcessResponse stored RunProcessResponse_Specified;
    property WindowTabData:      WindowTabData2         Index (IS_OPTN) read FWindowTabData write SetWindowTabData stored WindowTabData_Specified;
  end;



  // ************************************************************************ //
  // XML       : StandardResponse, global, <element>
  // Namespace : http://idempiere.org/ADInterface/1_0
  // ************************************************************************ //
  StandardResponse = class(StandardResponse2)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : outputField, global, <complexType>
  // Namespace : http://idempiere.org/ADInterface/1_0
  // ************************************************************************ //
  outputField = class(TRemotable)
  private
    Fcolumn: string;
    Fcolumn_Specified: boolean;
    Fvalue: string;
    Fvalue_Specified: boolean;
    FText: string;
    FText_Specified: boolean;
    procedure Setcolumn(Index: Integer; const Astring: string);
    function  column_Specified(Index: Integer): boolean;
    procedure Setvalue(Index: Integer; const Astring: string);
    function  value_Specified(Index: Integer): boolean;
    procedure SetText(Index: Integer; const Astring: string);
    function  Text_Specified(Index: Integer): boolean;
  published
    property column: string  Index (IS_ATTR or IS_OPTN) read Fcolumn write Setcolumn stored column_Specified;
    property value:  string  Index (IS_ATTR or IS_OPTN) read Fvalue write Setvalue stored value_Specified;
    property Text:   string  Index (IS_ATTR or IS_OPTN) read FText write SetText stored Text_Specified;
  end;



  // ************************************************************************ //
  // XML       : ModelSetDocAction, global, <complexType>
  // Namespace : http://idempiere.org/ADInterface/1_0
  // ************************************************************************ //
  ModelSetDocAction = class(TRemotable)
  private
    FserviceType: string;
    FtableName: string;
    FrecordID: Integer;
    FrecordIDVariable: string;
    FrecordIDVariable_Specified: boolean;
    FdocAction: string;
    procedure SetrecordIDVariable(Index: Integer; const Astring: string);
    function  recordIDVariable_Specified(Index: Integer): boolean;
  published
    property serviceType:      string   read FserviceType write FserviceType;
    property tableName:        string   read FtableName write FtableName;
    property recordID:         Integer  read FrecordID write FrecordID;
    property recordIDVariable: string   Index (IS_OPTN) read FrecordIDVariable write SetrecordIDVariable stored recordIDVariable_Specified;
    property docAction:        string   read FdocAction write FdocAction;
  end;



  // ************************************************************************ //
  // XML       : ModelSetDocActionRequest, global, <complexType>
  // Namespace : http://idempiere.org/ADInterface/1_0
  // ************************************************************************ //
  ModelSetDocActionRequest2 = class(TRemotable)
  private
    FModelSetDocAction: ModelSetDocAction;
    FADLoginRequest: ADLoginRequest2;
  public
    destructor Destroy; override;
  published
    property ModelSetDocAction: ModelSetDocAction  read FModelSetDocAction write FModelSetDocAction;
    property ADLoginRequest:    ADLoginRequest2    read FADLoginRequest write FADLoginRequest;
  end;



  // ************************************************************************ //
  // XML       : ModelSetDocActionRequest, global, <element>
  // Namespace : http://idempiere.org/ADInterface/1_0
  // ************************************************************************ //
  ModelSetDocActionRequest = class(ModelSetDocActionRequest2)
  private
  published
  end;


  // ************************************************************************ //
  // Namespace : http://idempiere.org/ADInterface/1_0
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // use       : literal
  // binding   : ModelADServiceSoapBinding
  // service   : ModelADService
  // port      : ModelADServiceImplPort
  // URL       : http://teste.brerp.com.br/ADInterface/services/ModelADService
  // ************************************************************************ //
  ModelADService = interface(IInvokable)
  ['{316E4B8F-C8E7-368C-AAF1-A08D6D7DFFA4}']
    function  createUpdateData(const arg0: ModelCRUDRequest): StandardResponse; stdcall;
    function  setDocAction(const arg0: ModelSetDocActionRequest): StandardResponse; stdcall;
    function  createData(const arg0: ModelCRUDRequest): StandardResponse; stdcall;
    function  deleteData(const arg0: ModelCRUDRequest): StandardResponse; stdcall;
    function  readData(const arg0: ModelCRUDRequest): WindowTabData; stdcall;
    function  getList(const arg0: ModelGetListRequest): WindowTabData; stdcall;
    function  runProcess(const arg0: ModelRunProcessRequest): RunProcessResponse; stdcall;
    function  updateData(const arg0: ModelCRUDRequest): StandardResponse; stdcall;
    function  queryData(const arg0: ModelCRUDRequest): WindowTabData; stdcall;
  end;

function GetModelADService(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): ModelADService;


implementation
  uses System.SysUtils;

function GetModelADService(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): ModelADService;
const
  defWSDL = 'http://teste.brerp.com.br/ADInterface/services/ModelADService?wsdl';
  defURL  = 'http://teste.brerp.com.br/ADInterface/services/ModelADService';
  defAdd  = '/ADInterface/services/ModelADService?wsdl';
  defSvc  = 'ModelADService';
  defPrt  = 'ModelADServiceImplPort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
    begin
      if UseWSDL then
        Addr := defWSDL
      else
        Addr := defURL;
    end else
      Addr := Addr + defAdd;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as ModelADService);
    if UseWSDL then
      begin
        RIO.WSDLLocation := Addr;
        RIO.Service := defSvc;
        RIO.Port := defPrt;
      end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


constructor ModelCRUDRequest2.Create;
begin
  inherited Create;
  FADLoginRequest := ADLoginRequest2.Create();
  FModelCRUD := BrERPwscPascal.ModelCRUD.Create();
end;

destructor ModelCRUDRequest2.Destroy;
begin
  System.SysUtils.FreeAndNil(FModelCRUD);
  System.SysUtils.FreeAndNil(FADLoginRequest);
  inherited Destroy;
end;

procedure WindowTabData2.SetNumRows(Index: Integer; const AInteger: Integer);
begin
  FNumRows := AInteger;
  FNumRows_Specified := True;
end;

function WindowTabData2.NumRows_Specified(Index: Integer): boolean;
begin
  Result := FNumRows_Specified;
end;

procedure WindowTabData2.SetTotalRows(Index: Integer; const AInteger: Integer);
begin
  FTotalRows := AInteger;
  FTotalRows_Specified := True;
end;

function WindowTabData2.TotalRows_Specified(Index: Integer): boolean;
begin
  Result := FTotalRows_Specified;
end;

procedure WindowTabData2.SetStartRow(Index: Integer; const AInteger: Integer);
begin
  FStartRow := AInteger;
  FStartRow_Specified := True;
end;

function WindowTabData2.StartRow_Specified(Index: Integer): boolean;
begin
  Result := FStartRow_Specified;
end;

procedure WindowTabData2.SetDataSet(Index: Integer; const ADataSet: DataSet);
begin
  FDataSet := ADataSet;
  FDataSet_Specified := True;
end;

function WindowTabData2.DataSet_Specified(Index: Integer): boolean;
begin
  Result := FDataSet_Specified;
end;

procedure WindowTabData2.SetRowCount(Index: Integer; const AInteger: Integer);
begin
  FRowCount := AInteger;
  FRowCount_Specified := True;
end;

function WindowTabData2.RowCount_Specified(Index: Integer): boolean;
begin
  Result := FRowCount_Specified;
end;

procedure WindowTabData2.SetSuccess(Index: Integer; const ABoolean: Boolean);
begin
  FSuccess := ABoolean;
  FSuccess_Specified := True;
end;

function WindowTabData2.Success_Specified(Index: Integer): boolean;
begin
  Result := FSuccess_Specified;
end;

procedure WindowTabData2.SetError(Index: Integer; const Astring: string);
begin
  FError := Astring;
  FError_Specified := True;
end;

function WindowTabData2.Error_Specified(Index: Integer): boolean;
begin
  Result := FError_Specified;
end;

procedure WindowTabData2.SetErrorInfo(Index: Integer; const Astring: string);
begin
  FErrorInfo := Astring;
  FErrorInfo_Specified := True;
end;

function WindowTabData2.ErrorInfo_Specified(Index: Integer): boolean;
begin
  Result := FErrorInfo_Specified;
end;

procedure WindowTabData2.SetStatus(Index: Integer; const Astring: string);
begin
  FStatus := Astring;
  FStatus_Specified := True;
end;

function WindowTabData2.Status_Specified(Index: Integer): boolean;
begin
  Result := FStatus_Specified;
end;

procedure WindowTabData2.SetStatusError(Index: Integer; const ABoolean: Boolean);
begin
  FStatusError := ABoolean;
  FStatusError_Specified := True;
end;

function WindowTabData2.StatusError_Specified(Index: Integer): boolean;
begin
  Result := FStatusError_Specified;
end;

destructor RunProcessResponse2.Destroy;
begin
  System.SysUtils.FreeAndNil(FData);
  inherited Destroy;
end;

procedure RunProcessResponse2.SetIsError(Index: Integer; const ABoolean: Boolean);
begin
  FIsError := ABoolean;
  FIsError_Specified := True;
end;

function RunProcessResponse2.IsError_Specified(Index: Integer): boolean;
begin
  Result := FIsError_Specified;
end;

procedure RunProcessResponse2.SetIsReport(Index: Integer; const ABoolean: Boolean);
begin
  FIsReport := ABoolean;
  FIsReport_Specified := True;
end;

function RunProcessResponse2.IsReport_Specified(Index: Integer): boolean;
begin
  Result := FIsReport_Specified;
end;

procedure RunProcessResponse2.SetReportFormat(Index: Integer; const Astring: string);
begin
  FReportFormat := Astring;
  FReportFormat_Specified := True;
end;

function RunProcessResponse2.ReportFormat_Specified(Index: Integer): boolean;
begin
  Result := FReportFormat_Specified;
end;

procedure LookupValue.Setval(Index: Integer; const Astring: string);
begin
  Fval := Astring;
  Fval_Specified := True;
end;

function LookupValue.val_Specified(Index: Integer): boolean;
begin
  Result := Fval_Specified;
end;

procedure LookupValue.Setkey(Index: Integer; const Astring: string);
begin
  Fkey := Astring;
  Fkey_Specified := True;
end;

function LookupValue.key_Specified(Index: Integer): boolean;
begin
  Result := Fkey_Specified;
end;

destructor DataField.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Flookup)-1 do
    System.SysUtils.FreeAndNil(Flookup[I]);
  System.SetLength(Flookup, 0);
  inherited Destroy;
end;

procedure DataField.Settype_(Index: Integer; const Astring: string);
begin
  Ftype_ := Astring;
  Ftype__Specified := True;
end;

function DataField.type__Specified(Index: Integer): boolean;
begin
  Result := Ftype__Specified;
end;

procedure DataField.Setcolumn(Index: Integer; const Astring: string);
begin
  Fcolumn := Astring;
  Fcolumn_Specified := True;
end;

function DataField.column_Specified(Index: Integer): boolean;
begin
  Result := Fcolumn_Specified;
end;

procedure DataField.Setlval(Index: Integer; const Astring: string);
begin
  Flval := Astring;
  Flval_Specified := True;
end;

function DataField.lval_Specified(Index: Integer): boolean;
begin
  Result := Flval_Specified;
end;

procedure DataField.Setdisp(Index: Integer; const ABoolean: Boolean);
begin
  Fdisp := ABoolean;
  Fdisp_Specified := True;
end;

function DataField.disp_Specified(Index: Integer): boolean;
begin
  Result := Fdisp_Specified;
end;

procedure DataField.Setedit(Index: Integer; const ABoolean: Boolean);
begin
  Fedit := ABoolean;
  Fedit_Specified := True;
end;

function DataField.edit_Specified(Index: Integer): boolean;
begin
  Result := Fedit_Specified;
end;

procedure DataField.Seterror(Index: Integer; const ABoolean: Boolean);
begin
  Ferror := ABoolean;
  Ferror_Specified := True;
end;

function DataField.error_Specified(Index: Integer): boolean;
begin
  Result := Ferror_Specified;
end;

procedure DataField.SeterrorVal(Index: Integer; const Astring: string);
begin
  FerrorVal := Astring;
  FerrorVal_Specified := True;
end;

function DataField.errorVal_Specified(Index: Integer): boolean;
begin
  Result := FerrorVal_Specified;
end;

procedure DataField.Setlookup(Index: Integer; const ALookupValues: LookupValues);
begin
  Flookup := ALookupValues;
  Flookup_Specified := True;
end;

function DataField.lookup_Specified(Index: Integer): boolean;
begin
  Result := Flookup_Specified;
end;

destructor ModelRunProcessRequest2.Destroy;
begin
  System.SysUtils.FreeAndNil(FModelRunProcess);
  System.SysUtils.FreeAndNil(FADLoginRequest);
  inherited Destroy;
end;

destructor ModelGetListRequest2.Destroy;
begin
  System.SysUtils.FreeAndNil(FModelGetList);
  System.SysUtils.FreeAndNil(FADLoginRequest);
  inherited Destroy;
end;

destructor ModelCRUD.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FDataRow)-1 do
    System.SysUtils.FreeAndNil(FDataRow[I]);
  System.SetLength(FDataRow, 0);
  inherited Destroy;
end;

procedure ModelCRUD.SetrecordIDVariable(Index: Integer; const Astring: string);
begin
  FrecordIDVariable := Astring;
  FrecordIDVariable_Specified := True;
end;

function ModelCRUD.recordIDVariable_Specified(Index: Integer): boolean;
begin
  Result := FrecordIDVariable_Specified;
end;

procedure ModelCRUD.SetFilter(Index: Integer; const Astring: string);
begin
  FFilter := Astring;
  FFilter_Specified := True;
end;

function ModelCRUD.Filter_Specified(Index: Integer): boolean;
begin
  Result := FFilter_Specified;
end;

procedure ModelCRUD.SetOffset(Index: Integer; const AInteger: Integer);
begin
  FOffset := AInteger;
  FOffset_Specified := True;
end;

function ModelCRUD.Offset_Specified(Index: Integer): boolean;
begin
  Result := FOffset_Specified;
end;

procedure ModelCRUD.SetLimit(Index: Integer; const AInteger: Integer);
begin
  FLimit := AInteger;
  FLimit_Specified := True;
end;

function ModelCRUD.Limit_Specified(Index: Integer): boolean;
begin
  Result := FLimit_Specified;
end;

procedure ModelCRUD.SetDataRow(Index: Integer; const ADataRow: DataRow);
begin
  FDataRow := ADataRow;
  FDataRow_Specified := True;
end;

function ModelCRUD.DataRow_Specified(Index: Integer): boolean;
begin
  Result := FDataRow_Specified;
end;

destructor ModelRunProcess2.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FParamValues)-1 do
    System.SysUtils.FreeAndNil(FParamValues[I]);
  System.SetLength(FParamValues, 0);
  inherited Destroy;
end;

procedure ModelRunProcess2.SetAD_Process_ID(Index: Integer; const AInteger: Integer);
begin
  FAD_Process_ID := AInteger;
  FAD_Process_ID_Specified := True;
end;

function ModelRunProcess2.AD_Process_ID_Specified(Index: Integer): boolean;
begin
  Result := FAD_Process_ID_Specified;
end;

procedure ModelRunProcess2.SetAD_Menu_ID(Index: Integer; const AInteger: Integer);
begin
  FAD_Menu_ID := AInteger;
  FAD_Menu_ID_Specified := True;
end;

function ModelRunProcess2.AD_Menu_ID_Specified(Index: Integer): boolean;
begin
  Result := FAD_Menu_ID_Specified;
end;

procedure ModelRunProcess2.SetAD_Record_ID(Index: Integer; const AInteger: Integer);
begin
  FAD_Record_ID := AInteger;
  FAD_Record_ID_Specified := True;
end;

function ModelRunProcess2.AD_Record_ID_Specified(Index: Integer): boolean;
begin
  Result := FAD_Record_ID_Specified;
end;

procedure ModelRunProcess2.SetDocAction(Index: Integer; const Astring: string);
begin
  FDocAction := Astring;
  FDocAction_Specified := True;
end;

function ModelRunProcess2.DocAction_Specified(Index: Integer): boolean;
begin
  Result := FDocAction_Specified;
end;

destructor StandardResponse2.Destroy;
begin
  System.SysUtils.FreeAndNil(FRunProcessResponse);
  System.SysUtils.FreeAndNil(FWindowTabData);
  inherited Destroy;
end;

procedure StandardResponse2.SetIsError(Index: Integer; const ABoolean: Boolean);
begin
  FIsError := ABoolean;
  FIsError_Specified := True;
end;

function StandardResponse2.IsError_Specified(Index: Integer): boolean;
begin
  Result := FIsError_Specified;
end;

procedure StandardResponse2.SetIsRolledBack(Index: Integer; const ABoolean: Boolean);
begin
  FIsRolledBack := ABoolean;
  FIsRolledBack_Specified := True;
end;

function StandardResponse2.IsRolledBack_Specified(Index: Integer): boolean;
begin
  Result := FIsRolledBack_Specified;
end;

procedure StandardResponse2.SetRecordID(Index: Integer; const AInteger: Integer);
begin
  FRecordID := AInteger;
  FRecordID_Specified := True;
end;

function StandardResponse2.RecordID_Specified(Index: Integer): boolean;
begin
  Result := FRecordID_Specified;
end;

procedure StandardResponse2.SetError(Index: Integer; const Astring: string);
begin
  FError := Astring;
  FError_Specified := True;
end;

function StandardResponse2.Error_Specified(Index: Integer): boolean;
begin
  Result := FError_Specified;
end;

procedure StandardResponse2.SetoutputFields(Index: Integer; const AArray_Of_outputFields: Array_Of_outputFields);
begin
  FoutputFields := AArray_Of_outputFields;
  FoutputFields_Specified := True;
end;

function StandardResponse2.outputFields_Specified(Index: Integer): boolean;
begin
  Result := FoutputFields_Specified;
end;

procedure StandardResponse2.SetRunProcessResponse(Index: Integer; const ARunProcessResponse2: RunProcessResponse2);
begin
  FRunProcessResponse := ARunProcessResponse2;
  FRunProcessResponse_Specified := True;
end;

function StandardResponse2.RunProcessResponse_Specified(Index: Integer): boolean;
begin
  Result := FRunProcessResponse_Specified;
end;

procedure StandardResponse2.SetWindowTabData(Index: Integer; const AWindowTabData2: WindowTabData2);
begin
  FWindowTabData := AWindowTabData2;
  FWindowTabData_Specified := True;
end;

function StandardResponse2.WindowTabData_Specified(Index: Integer): boolean;
begin
  Result := FWindowTabData_Specified;
end;

procedure outputField.Setcolumn(Index: Integer; const Astring: string);
begin
  Fcolumn := Astring;
  Fcolumn_Specified := True;
end;

function outputField.column_Specified(Index: Integer): boolean;
begin
  Result := Fcolumn_Specified;
end;

procedure outputField.Setvalue(Index: Integer; const Astring: string);
begin
  Fvalue := Astring;
  Fvalue_Specified := True;
end;

function outputField.value_Specified(Index: Integer): boolean;
begin
  Result := Fvalue_Specified;
end;

procedure outputField.SetText(Index: Integer; const Astring: string);
begin
  FText := Astring;
  FText_Specified := True;
end;

function outputField.Text_Specified(Index: Integer): boolean;
begin
  Result := FText_Specified;
end;

procedure ModelSetDocAction.SetrecordIDVariable(Index: Integer; const Astring: string);
begin
  FrecordIDVariable := Astring;
  FrecordIDVariable_Specified := True;
end;

function ModelSetDocAction.recordIDVariable_Specified(Index: Integer): boolean;
begin
  Result := FrecordIDVariable_Specified;
end;

destructor ModelSetDocActionRequest2.Destroy;
begin
  System.SysUtils.FreeAndNil(FModelSetDocAction);
  System.SysUtils.FreeAndNil(FADLoginRequest);
  inherited Destroy;
end;

initialization
  { ModelADService }
  InvRegistry.RegisterInterface(TypeInfo(ModelADService), 'http://idempiere.org/ADInterface/1_0', '');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ModelADService), '');
  InvRegistry.RegisterInvokeOptions(TypeInfo(ModelADService), ioDocument);
  { ModelADService.createUpdateData }
  InvRegistry.RegisterParamInfo(TypeInfo(ModelADService), 'createUpdateData', 'arg0', 'ModelCRUDRequest',
                                '[Namespace="http://idempiere.org/ADInterface/1_0"]');
  InvRegistry.RegisterParamInfo(TypeInfo(ModelADService), 'createUpdateData', 'return', '',
                                '[Namespace="http://idempiere.org/ADInterface/1_0"]');
  { ModelADService.setDocAction }
  InvRegistry.RegisterParamInfo(TypeInfo(ModelADService), 'setDocAction', 'arg0', 'ModelSetDocActionRequest',
                                '[Namespace="http://idempiere.org/ADInterface/1_0"]');
  InvRegistry.RegisterParamInfo(TypeInfo(ModelADService), 'setDocAction', 'return', '',
                                '[Namespace="http://idempiere.org/ADInterface/1_0"]');
  { ModelADService.createData }
  InvRegistry.RegisterParamInfo(TypeInfo(ModelADService), 'createData', 'arg0', 'ModelCRUDRequest',
                                '[Namespace="http://idempiere.org/ADInterface/1_0"]');
  InvRegistry.RegisterParamInfo(TypeInfo(ModelADService), 'createData', 'return', '',
                                '[Namespace="http://idempiere.org/ADInterface/1_0"]');
  { ModelADService.deleteData }
  InvRegistry.RegisterParamInfo(TypeInfo(ModelADService), 'deleteData', 'arg0', 'ModelCRUDRequest',
                                '[Namespace="http://idempiere.org/ADInterface/1_0"]');
  InvRegistry.RegisterParamInfo(TypeInfo(ModelADService), 'deleteData', 'return', '',
                                '[Namespace="http://idempiere.org/ADInterface/1_0"]');
  { ModelADService.readData }
  InvRegistry.RegisterParamInfo(TypeInfo(ModelADService), 'readData', 'arg0', 'ModelCRUDRequest',
                                '[Namespace="http://idempiere.org/ADInterface/1_0"]');
  InvRegistry.RegisterParamInfo(TypeInfo(ModelADService), 'readData', 'return', '',
                                '[Namespace="http://idempiere.org/ADInterface/1_0"]');
  { ModelADService.getList }
  InvRegistry.RegisterParamInfo(TypeInfo(ModelADService), 'getList', 'arg0', 'ModelGetListRequest',
                                '[Namespace="http://idempiere.org/ADInterface/1_0"]');
  InvRegistry.RegisterParamInfo(TypeInfo(ModelADService), 'getList', 'return', '',
                                '[Namespace="http://idempiere.org/ADInterface/1_0"]');
  { ModelADService.runProcess }
  InvRegistry.RegisterParamInfo(TypeInfo(ModelADService), 'runProcess', 'arg0', 'ModelRunProcessRequest',
                                '[Namespace="http://idempiere.org/ADInterface/1_0"]');
  InvRegistry.RegisterParamInfo(TypeInfo(ModelADService), 'runProcess', 'return', '',
                                '[Namespace="http://idempiere.org/ADInterface/1_0"]');
  { ModelADService.updateData }
  InvRegistry.RegisterParamInfo(TypeInfo(ModelADService), 'updateData', 'arg0', 'ModelCRUDRequest',
                                '[Namespace="http://idempiere.org/ADInterface/1_0"]');
  InvRegistry.RegisterParamInfo(TypeInfo(ModelADService), 'updateData', 'return', '',
                                '[Namespace="http://idempiere.org/ADInterface/1_0"]');
  { ModelADService.queryData }
  InvRegistry.RegisterParamInfo(TypeInfo(ModelADService), 'queryData', 'arg0', 'ModelCRUDRequest',
                                '[Namespace="http://idempiere.org/ADInterface/1_0"]');
  InvRegistry.RegisterParamInfo(TypeInfo(ModelADService), 'queryData', 'return', '',
                                '[Namespace="http://idempiere.org/ADInterface/1_0"]');
  RemClassRegistry.RegisterXSClass(ModelCRUDRequest2, 'http://idempiere.org/ADInterface/1_0', 'ModelCRUDRequest2', 'ModelCRUDRequest');
  RemClassRegistry.RegisterXSClass(ModelCRUDRequest, 'http://idempiere.org/ADInterface/1_0', 'ModelCRUDRequest');
  RemClassRegistry.RegisterXSInfo(TypeInfo(LookupValues), 'http://idempiere.org/ADInterface/1_0', 'LookupValues');
  RemClassRegistry.RegisterXSInfo(TypeInfo(DataRow), 'http://idempiere.org/ADInterface/1_0', 'DataRow');
  RemClassRegistry.RegisterXSInfo(TypeInfo(DataSet), 'http://idempiere.org/ADInterface/1_0', 'DataSet');
  RemClassRegistry.RegisterXSClass(WindowTabData2, 'http://idempiere.org/ADInterface/1_0', 'WindowTabData2', 'WindowTabData');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(WindowTabData2), 'DataSet', '[ArrayItemName="DataRow"]');
  RemClassRegistry.RegisterXSClass(WindowTabData, 'http://idempiere.org/ADInterface/1_0', 'WindowTabData');
  RemClassRegistry.RegisterXSClass(RunProcessResponse2, 'http://idempiere.org/ADInterface/1_0', 'RunProcessResponse2', 'RunProcessResponse');
  RemClassRegistry.RegisterXSClass(RunProcessResponse, 'http://idempiere.org/ADInterface/1_0', 'RunProcessResponse');
  RemClassRegistry.RegisterXSClass(LookupValue, 'http://idempiere.org/ADInterface/1_0', 'LookupValue');
  RemClassRegistry.RegisterXSClass(DataField, 'http://idempiere.org/ADInterface/1_0', 'DataField');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(DataField), 'type_', '[ExtName="type"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(DataField), 'lookup', '[ArrayItemName="lv"]');
  RemClassRegistry.RegisterXSClass(ADLoginRequest2, 'http://idempiere.org/ADInterface/1_0', 'ADLoginRequest2', 'ADLoginRequest');
  RemClassRegistry.RegisterXSClass(ADLoginRequest, 'http://idempiere.org/ADInterface/1_0', 'ADLoginRequest');
  RemClassRegistry.RegisterXSClass(ModelRunProcessRequest2, 'http://idempiere.org/ADInterface/1_0', 'ModelRunProcessRequest2', 'ModelRunProcessRequest');
  RemClassRegistry.RegisterXSClass(ModelRunProcessRequest, 'http://idempiere.org/ADInterface/1_0', 'ModelRunProcessRequest');
  RemClassRegistry.RegisterXSClass(ModelGetList, 'http://idempiere.org/ADInterface/1_0', 'ModelGetList');
  RemClassRegistry.RegisterXSClass(ModelGetListRequest2, 'http://idempiere.org/ADInterface/1_0', 'ModelGetListRequest2', 'ModelGetListRequest');
  RemClassRegistry.RegisterXSClass(ModelGetListRequest, 'http://idempiere.org/ADInterface/1_0', 'ModelGetListRequest');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Action), 'http://idempiere.org/ADInterface/1_0', 'Action');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(Action), 'Read_', 'Read');
  RemClassRegistry.RegisterXSClass(ModelCRUD, 'http://idempiere.org/ADInterface/1_0', 'ModelCRUD');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(ModelCRUD), 'DataRow', '[ArrayItemName="field"]');
  RemClassRegistry.RegisterXSClass(ModelRunProcess2, 'http://idempiere.org/ADInterface/1_0', 'ModelRunProcess2', 'ModelRunProcess');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(ModelRunProcess2), 'ParamValues', '[ArrayItemName="field"]');
  RemClassRegistry.RegisterXSClass(ModelRunProcess, 'http://idempiere.org/ADInterface/1_0', 'ModelRunProcess');
  RemClassRegistry.RegisterXSInfo(TypeInfo(outputFields), 'http://idempiere.org/ADInterface/1_0', 'outputFields');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_outputFields), 'http://idempiere.org/ADInterface/1_0', 'Array_Of_outputFields');
  RemClassRegistry.RegisterXSClass(StandardResponse2, 'http://idempiere.org/ADInterface/1_0', 'StandardResponse2', 'StandardResponse');
  RemClassRegistry.RegisterXSClass(StandardResponse, 'http://idempiere.org/ADInterface/1_0', 'StandardResponse');
  RemClassRegistry.RegisterXSClass(outputField, 'http://idempiere.org/ADInterface/1_0', 'outputField');
  RemClassRegistry.RegisterXSClass(ModelSetDocAction, 'http://idempiere.org/ADInterface/1_0', 'ModelSetDocAction');
  RemClassRegistry.RegisterXSClass(ModelSetDocActionRequest2, 'http://idempiere.org/ADInterface/1_0', 'ModelSetDocActionRequest2', 'ModelSetDocActionRequest');
  RemClassRegistry.RegisterXSClass(ModelSetDocActionRequest, 'http://idempiere.org/ADInterface/1_0', 'ModelSetDocActionRequest');

end.