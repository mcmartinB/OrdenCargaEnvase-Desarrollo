
unit UFOrdenCarga;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, ExtCtrls, Buttons, ActnList, Grids, DBGrids, BGrid, BDEdit,
  BSpeedButton, Menus, ComCtrls, BCalendario, BEdit, BCalendarButton, BGridButton,
  QRPrntr, DBTables, DBCtrls, bDialogs, bSQLUtils, bTimeUtils, StrUtils,
  ToolWin, ImgList, UDOrdenCarga, AFQuickMail, QRPDFFilt, QRExport;

//ESTADOS
const
   kVisualizar = 0;
   kNuevaCabecera = 1;
   kEditarCabecera = 2;
   kNuevoDetalle = 3;
   kEditarDetalle = 4;

type
  TFOrdenCarga = class( TForm )
    PMaestro: TPanel;
    DSMaestro: TDataSource;
    LEmpresa_p: TLabel;
    empresa_occ: TBDEdit;
    Label13: TLabel;
    Label1: TLabel;
    BGBCentro_occ: TBGridButton;
    centro_salida_occ: TBDEdit;
    STCentro_salida_occ: TStaticText;
    Label5: TLabel;
    vehiculo_occ: TBDEdit;
    transporte_occ: TBDEdit;
    DSDetalle: TDataSource;
    LAno_semana_p: TLabel;
    STTransporte_occ: TStaticText;
    BGBtransporte_occ: TBGridButton;
    BGBEmpresa_occ: TBGridButton;
    STEmpresa_occ: TStaticText;
    Label11: TLabel;
    fecha_occ: TBDEdit;
    hora_occ: TBDEdit;
    BCBFecha_occ: TBCalendarButton;
    QOrdenCargaC: TQuery;
    nota_occ: TDBMemo;
    QOrdenCargaL: TQuery;
    ToolBar1: TToolBar;
    btnAlta: TToolButton;
    sep4: TToolButton;
    btnEditarC: TToolButton;
    btnBorrar: TToolButton;
    btnLocalizar: TToolButton;
    sep2: TToolButton;
    btnAltaD: TToolButton;
    btnEditarD: TToolButton;
    btnBorrarD: TToolButton;
    sep3: TToolButton;
    btnPrimero: TToolButton;
    btnAnterior: TToolButton;
    btnProximo: TToolButton;
    btnUltimo: TToolButton;
    sep1: TToolButton;
    btnAceptar: TToolButton;
    btnCancelar: TToolButton;
    QOrdenCargaCorden_occ: TIntegerField;
    QOrdenCargaCempresa_occ: TStringField;
    QOrdenCargaCcentro_salida_occ: TStringField;
    QOrdenCargaCn_albaran_occ: TIntegerField;
    QOrdenCargaCfecha_occ: TDateField;
    QOrdenCargaChora_occ: TStringField;
    QOrdenCargaCcliente_sal_occ: TStringField;
    QOrdenCargaCdir_sum_occ: TStringField;
    QOrdenCargaCcliente_fac_occ: TStringField;
    QOrdenCargaCn_pedido_occ: TStringField;
    QOrdenCargaCmoneda_occ: TStringField;
    QOrdenCargaCtransporte_occ: TSmallintField;
    QOrdenCargaCvehiculo_occ: TStringField;
    QOrdenCargaCnota_occ: TMemoField;
    QOrdenCargaCstatus_occ: TIntegerField;
    QOrdenCargaLorden_ocl: TIntegerField;
    QOrdenCargaLlinea_ocl: TIntegerField;
    QOrdenCargaLempresa_ocl: TStringField;
    QOrdenCargaLcentro_salida_ocl: TStringField;
    QOrdenCargaLn_albaran_ocl: TIntegerField;
    QOrdenCargaLfecha_ocl: TDateField;
    QOrdenCargaLcentro_origen_ocl: TStringField;
    QOrdenCargaLproducto_ocl: TStringField;
    QOrdenCargaLenvase_ocl: TStringField;
    QOrdenCargaLmarca_ocl: TStringField;
    QOrdenCargaLcategoria_ocl: TStringField;
    QOrdenCargaLcalibre_ocl: TStringField;
    QOrdenCargaLcolor_ocl: TStringField;
    QOrdenCargaLref_transitos_ocl: TIntegerField;
    QOrdenCargaLcajas_ocl: TIntegerField;
    QOrdenCargaLkilos_ocl: TFloatField;
    QOrdenCargaLprecio_ocl: TFloatField;
    QOrdenCargaLunidad_precio_ocl: TStringField;
    QOrdenCargaLimporte_neto_ocl: TFloatField;
    QOrdenCargaLporc_iva_ocl: TFloatField;
    QOrdenCargaLiva_ocl: TFloatField;
    QOrdenCargaLimporte_total_ocl: TFloatField;
    QOrdenCargaLn_palets_ocl: TSmallintField;
    QOrdenCargaLtipo_palets_ocl: TStringField;
    QOrdenCargaLtipo_iva_ocl: TStringField;
    QOrdenCargaLfederacion_ocl: TStringField;
    QOrdenCargaLcliente_ocl: TStringField;
    QOrdenCargaLemp_procede_ocl: TStringField;
    ImageList: TImageList;
    btnImprimir: TToolButton;
    Label3: TLabel;
    orden_occ: TBDEdit;
    des_status_occ: TDBText;
    QOrdenCargaCdes_status_occ: TStringField;
    Label4: TLabel;
    Bevel2: TBevel;
    btnCrearAlbaran: TToolButton;
    sep5: TToolButton;
    PopupMenuImprimir: TPopupMenu;
    mnuImprimirOrdenCarga: TMenuItem;
    mnuImprimirPackingList: TMenuItem;
    btnActivar: TToolButton;
    PopupMenuFiltro: TPopupMenu;
    mnuCreadas: TMenuItem;
    mnuActivas: TMenuItem;
    mnuInicializadas: TMenuItem;
    mnuFinalizadas: TMenuItem;
    btnFinalizar: TToolButton;
    QOrdenCargaCtraspasada_occ: TIntegerField;
    PageControl1: TPageControl;
    tsLineas: TTabSheet;
    RVisualizacion: TDBGrid;
    PDetalle: TPanel;
    Label2: TLabel;
    BGBProducto_ocl: TBGridButton;
    Label6: TLabel;
    BGBEnvase_ocl: TBGridButton;
    Label15: TLabel;
    BGBMarca_ocl: TBGridButton;
    Label16: TLabel;
    BGBCategoria_ocl: TBGridButton;
    Label17: TLabel;
    BGBColor_ocl: TBGridButton;
    Label18: TLabel;
    Label21: TLabel;
    Label30: TLabel;
    BGBCalibre_ocl: TBGridButton;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Lporc_iva_ocl: TLabel;
    Liva_ocl: TLabel;
    LImporteTotal: TLabel;
    STProducto_ocl: TStaticText;
    producto_ocl: TBDEdit;
    envase_ocl: TBDEdit;
    STEnvase_ocl: TStaticText;
    marca_ocl: TBDEdit;
    STMarca_ocl: TStaticText;
    categoria_ocl: TBDEdit;
    STCategoria_ocl: TStaticText;
    color_ocl: TBDEdit;
    STcolor_ocl: TStaticText;
    cajas_ocl: TBDEdit;
    precio_ocl: TBDEdit;
    calibre_ocl: TBDEdit;
    kilos_ocl: TBDEdit;
    unidad_precio_ocl: TBDEdit;
    importe_neto_ocl: TBDEdit;
    STUnidades: TStaticText;
    porc_iva_ocl: TBDEdit;
    iva_ocl: TBDEdit;
    importe_total_ocl: TBDEdit;
    tipo_iva_ocl: TBDEdit;
    QOrdenCargaCdes_traspasada_occ: TStringField;
    DBText1: TDBText;
    Shape1: TShape;
    ToolButton1: TToolButton;
    QOrdenCargaLfecha_transito_ocl: TDateField;
    QOrdenCargaCcentro_destino_occ: TStringField;
    EnvaseCalibreyColor1: TMenuItem;
    EnvasesLogifruit1: TMenuItem;
    ipoPalets1: TMenuItem;
    Label22: TLabel;
    n_palets_occ: TBDEdit;
    QOrdenCargaCn_palets_occ: TIntegerField;
    btnResumen: TToolButton;
    QOrdenCargaCdes2_status_occ: TStringField;
    QOrdenCargaCdes2_traspasada_occ: TStringField;
    QPalets: TQuery;
    QOrdenCargaCpalets_cargados_occ: TIntegerField;
    DBText2: TDBText;
    Label24: TLabel;
    Label25: TLabel;
    lblPortes: TLabel;
    porte_bonny_occ: TDBCheckBox;
    QOrdenCargaCdes_suministro_occ: TStringField;
    QOrdenCargaCporte_bonny_occ: TIntegerField;
    N1: TMenuItem;
    mnuEnviarCorreo: TMenuItem;
    AFQuickMail: TAFQuickMail;
    Label37: TLabel;
    higiene_occ: TDBCheckBox;
    QOrdenCargaChigiene_occ: TIntegerField;
    Label9: TLabel;
    lblPalets: TLabel;
    n_palets_ocl: TBDEdit;
    Label10: TLabel;
    tipo_palets_ocl: TBDEdit;
    BGridButton1: TBGridButton;
    stTipoPalet: TStaticText;
    Label12: TLabel;
    nota_interna_occ: TDBMemo;
    QOrdenCargaCnota_interna_occ: TStringField;
    lblNombre1: TLabel;
    operador_transporte_occ: TBDEdit;
    BGBoperador_transporte_occ: TBGridButton;
    SToperador_transporte_occ: TStaticText;
    QOrdenCargaCoperador_transporte_occ: TSmallintField;
    status_occ: TBDEdit;
    btnBalanza: TToolButton;
    QRExcelFilter1: TQRExcelFilter;
    QRPDFFilter1: TQRPDFFilter;
    N2: TMenuItem;
    mnuImprimirPackingSimple: TMenuItem;
    pmCrearAlbaran: TPopupMenu;
    mnuIgnorarPacking: TMenuItem;
    mnuSepUnirAlbaran: TMenuItem;
    mnuUnirAlbaran: TMenuItem;
    pgcDestino: TPageControl;
    tsSalida: TTabSheet;
    tsTransito: TTabSheet;
    lblDestino: TLabel;
    edt_centro_destino_occ: TBDEdit;
    btn_centro_destino_occ: TBGridButton;
    st_centro_destino_occ: TStaticText;
    lblNombre2: TLabel;
    cliente_sal_occ: TBDEdit;
    btnBGBCliente_sal_occ: TBGridButton;
    STcliente_sal_occ: TStaticText;
    lblNombre3: TLabel;
    dir_sum_occ: TBDEdit;
    btnBGBDir_sum_occ: TBGridButton;
    STdir_sum_occ: TStaticText;
    n_pedido_occ: TBDEdit;
    lblLPedido: TLabel;
    STmoneda_occ: TStaticText;
    btnBGBMoneda_occ: TBGridButton;
    moneda_occ: TBDEdit;
    lblNombre4: TLabel;
    lbl1: TLabel;
    edt_planta_destino_occ: TBDEdit;
    btn_planta_destino_occ: TBGridButton;
    st_planta_destino_occ: TStaticText;
    lblNombre5: TLabel;
    edt_planta_origen_occ: TBDEdit;
    btn2: TBGridButton;
    st_planta_origen_occ: TStaticText;
    lblNombre6: TLabel;
    edt_centro_origen_occ: TBDEdit;
    btn3: TBGridButton;
    st_centro_origen_occ: TStaticText;
    QOrdenCargaCplanta_origen_occ: TStringField;
    QOrdenCargaCplanta_destino_occ: TStringField;
    QOrdenCargaCfecha_pedido_occ: TDateField;
    QOrdenCargaCoperador_occ: TSmallintField;
    QOrdenCargaCmuelle_occ: TStringField;
    OrdenCargaCompleta1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAltaClick(Sender: TObject);
    procedure btnEditarCClick(Sender: TObject);
    procedure btnBorrarClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnAltaDClick(Sender: TObject);
    procedure btnEditarDClick(Sender: TObject);
    procedure btnBorrarDClick(Sender: TObject);
    procedure btnPrimeroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QOrdenCargaCNewRecord(DataSet: TDataSet);
    procedure QOrdenCargaCCalcFields(DataSet: TDataSet);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BCBFecha_occClick(Sender: TObject);
    procedure empresa_occChange(Sender: TObject);
    procedure centro_salida_occChange(Sender: TObject);
    procedure cliente_sal_occChange(Sender: TObject);
    procedure dir_sum_occChange(Sender: TObject);
    procedure moneda_occChange(Sender: TObject);
    procedure transporte_occChange(Sender: TObject);
    procedure producto_oclChange(Sender: TObject);
    procedure envase_oclChange(Sender: TObject);
    procedure marca_oclChange(Sender: TObject);
    procedure categoria_oclChange(Sender: TObject);
    procedure color_oclChange(Sender: TObject);
    procedure BGBEmpresa_occClick(Sender: TObject);
    procedure BGBCentro_occClick(Sender: TObject);
    procedure btnBGBCliente_sal_occClick(Sender: TObject);
    procedure btnBGBDir_sum_occClick(Sender: TObject);
    procedure btnBGBMoneda_occClick(Sender: TObject);
    procedure BGBtransporte_occClick(Sender: TObject);
    procedure QOrdenCargaCAfterEdit(DataSet: TDataSet);
    procedure QOrdenCargaCBeforePost(DataSet: TDataSet);
    procedure QOrdenCargaLBeforePost(DataSet: TDataSet);
    procedure QOrdenCargaLAfterEdit(DataSet: TDataSet);
    procedure BGBProducto_oclClick(Sender: TObject);
    procedure BGBEnvase_oclClick(Sender: TObject);
    procedure BGBMarca_oclClick(Sender: TObject);
    procedure BGBCalibre_oclClick(Sender: TObject);
    procedure BGBCategoria_oclClick(Sender: TObject);
    procedure BGBColor_oclClick(Sender: TObject);
    procedure cajas_oclChange(Sender: TObject);
    procedure kilos_oclChange(Sender: TObject);
    procedure precio_oclChange(Sender: TObject);
    procedure QOrdenCargaLAfterInsert(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure QOrdenCargaCAfterPost(DataSet: TDataSet);
    procedure mnuImprimirOrdenClick(Sender: TObject);
    procedure mnuImprimirPackingListClick(Sender: TObject);
    procedure mnuFiltroClick(Sender: TObject);
    procedure btnActivarClick(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
    procedure btn_centro_destino_occClick(Sender: TObject);
    procedure edt_centro_destino_occChange(Sender: TObject);
    procedure btnCrearAlbaranClick(Sender: TObject);
    //procedure TimerTimer(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure EnvaseCalibreyColor1Click(Sender: TObject);
    procedure EnvasesLogifruit1Click(Sender: TObject);
    procedure ipoPalets1Click(Sender: TObject);
    procedure btnRefrescarClick(Sender: TObject);
    procedure btnResumenClick(Sender: TObject);
    procedure porte_bonny_occEnter(Sender: TObject);
    procedure porte_bonny_occExit(Sender: TObject);
    procedure mnuEnviarCorreoClick(Sender: TObject);
    procedure QOrdenCargaLAfterPost(DataSet: TDataSet);
    procedure BGBTipo_Palet_oclClick(Sender: TObject);
    procedure tipo_palets_oclChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure operador_transporte_occChange(Sender: TObject);
    procedure BGBoperador_transporte_occClick(Sender: TObject);
    procedure importe_neto_oclChange(Sender: TObject);
    procedure status_occChange(Sender: TObject);
    procedure btnBalanzaClick(Sender: TObject);
    procedure mnuImprimirPackingSimpleClick(Sender: TObject);
    procedure mnuIgnorarPackingClick(Sender: TObject);
    procedure mnuUnirAlbaranClick(Sender: TObject);
    procedure btn_planta_destino_occClick(Sender: TObject);
    procedure edt_planta_destino_occChange(Sender: TObject);
    procedure QOrdenCargaCAfterOpen(DataSet: TDataSet);
    procedure QOrdenCargaCAfterScroll(DataSet: TDataSet);
    procedure dir_sum_occExit(Sender: TObject);
    procedure OrdenCargaCompleta1Click(Sender: TObject);

  private
    { Private declarations }
    sFiltro: string;

    EstadoAnterior: integer;
    EstadoActual: integer;

    bEscape: boolean;

    sEmpresaActual, sCentroActual, sFechaActual, sClienteActual: string;
    rImpuestosActual: TImpuesto;

    bPesoVariable: boolean;
    rPesoCaja, rKilos, rPrecio, rImporte, rIva, rTotal: real;
    iCajas, iUnidadesCaja, iUnidades: integer;
    sFacturar: string;
    rKilosAnterior: Real;

    procedure ActualizarEstado( const AEstado: integer );
    procedure HabilitarBarra;
    procedure DesHabilitarBarra;
    procedure Visualizar;
    procedure EditarC;
    procedure EditarD;
    procedure VisualizarOrden( const AOrden: string );
    procedure RefrescarOrden( const AOrden: string );
    procedure RefrescarDetalle;

    procedure PonInicializada;
    procedure PonFinalizada;
    procedure CrearAlbaran( const APacking: Boolean );
    procedure CrearTransito( const APacking: Boolean );
    function  ValidarTransito: boolean;

    procedure BorrarOrdenActual( const APreguntar: Boolean );
    procedure BorrarDetalleActual( const APreguntar: Boolean );
    procedure FiltrarOrdenes;

    procedure ConstruirFiltro;

    procedure DesplegarRejilla( const AControl: TControl );

    procedure Aceptar;
    procedure ComprobarEnvase;

    procedure UnirTransito;
    procedure UnirAlbaran;
  public

    procedure ActualizarValores;
    procedure ActualizarValoresCantidad;
    procedure ActualizarValoresPrecio;
    procedure ActualizarValoresImporte;
  end;

var
  FOrdenCarga: TFOrdenCarga;

implementation

{$R *.DFM}

uses UFFiltro, UFCalendario, UFRejilla, UFTransportistas,  UFClientes,
     UDDescripciones, UDTraspasar, UQOrdenCompleta, Math, UFResumen,
     bCalculadora, UFSuministros, UFDistribuirPeso, UQOrdenPackingSimple,
     UFAsignarAlbaran, UFAsignarTransito;

procedure TFOrdenCarga.FormCreate(Sender: TObject);
begin
  bEscape:= false;

  UDDescripciones.InicializaModulo( DOrdenCarga.Database.DatabaseName );
  UFRejilla.InicializaModulo( DOrdenCarga.Database.DatabaseName );
  UFTransportistas.InicializaModulo( DOrdenCarga.Database.DatabaseName );
  UFClientes.InicializaModulo( DOrdenCarga.Database.DatabaseName );
  UFSuministros.InicializaModulo( DOrdenCarga.Database.DatabaseName );

  with QOrdenCargaC do
  begin
    SQL.Clear;
    SQL.Add(' select * from frf_orden_carga_c ');
    SQL.Add(' where fecha_occ = :fecha ');
    SQL.Add(' order by fecha_occ desc, status_occ, orden_occ desc ');
    ParamByName('fecha').asDateTime:= Date;
    sFiltro:= ' where fecha_occ = ' + DateToStr( Date );
    Open;
  end;
  with QOrdenCargaL do
  begin
    SQL.Clear;
    SQL.Add(' select * ');
    SQL.Add(' from frf_orden_carga_l ');
    SQL.Add(' where orden_ocl = :orden_occ ');
    Prepare;
    Open;
  end;
  ActualizarEstado( kVisualizar );

  QPalets.Prepare;


  Top:= ( Screen.Height - Height ) div 2;
  Left:= ( Screen.Width - Width ) div 2;

  UFResumen.InicializarResumenOrdenes( self, QOrdenCargaC );

{
  if gsEmpresa = '078' then
  begin
    //Cabecera
    centro_destino_occ.Enabled:= False;
    BGBCentro_destino_occ.Enabled:= False;
    (*
    lblDestino.Visible:= False;
    centro_destino_occ.Visible:= False;
    BGBCentro_destino_occ.Visible:= False;
    STcentro_destino_occ.Visible:= False;
    lblTransito.Visible:= False;
    lblSalida.Visible:= False;
    ShapeTransito.Visible:= False;
    ShapeSalida.Visible:= False;
    *)
    //Detalle
    ref_transitos_ocl.Enabled:= False;
    fecha_transito_ocl.Enabled:= False;
    BCBFecha_transito_ocl.Enabled:= False;
    centro_origen_ocl.Enabled:= False;
    BGBCentro_origen_ocl.Enabled:= False;

    lblPortes.Caption:= ' Portes Pagados';
  end;
}
end;

procedure TFOrdenCarga.FormShow(Sender: TObject);
begin
  (*
  //SOLO SI ES UN WINDOWS XP
  AnimateWindow( Handle, 400, AW_ACTIVATE or AW_SLIDE or AW_VER_POSITIVE ); //AW_CENTER );
  RedrawWindow( Handle, nil, 0, RDW_ERASE or RDW_FRAME or RDW_INVALIDATE or RDW_ALLCHILDREN );
  *)
end;

procedure TFOrdenCarga.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose:=
    (Application.MessageBox('�Seguro que desea cerrar la aplicaci�n?', 'CERRAR APLICACI�N', MB_YESNO ) = IDYES );
end;

procedure TFOrdenCarga.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  UFResumen.FinalizarResumenOrdenes;

  QOrdenCargaL.Close;
  QOrdenCargaC.Close;

  UDDescripciones.FinalizaModulo;
  UFRejilla.FinalizaModulo;
  UFTransportistas.FinalizaModulo;
  UFClientes.FinalizaModulo;
  UFSuministros.FinalizaModulo;

  QOrdenCargaL.UnPrepare;
  QPalets.UnPrepare;
end;

procedure TFOrdenCarga.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if EstadoActual = kVisualizar then
  begin
    case Key of
      VK_ADD:
            if ssShift in Shift then
            begin
              if btnAltaD.Enabled then
                btnAltaD.Click;
            end
            else
            begin
              if btnAlta.Enabled then
                btnAlta.Click;
            end;
      VK_SUBTRACT:
            if ssShift in Shift then
            begin
              if btnBorrarD.Enabled then
                btnBorrarD.Click;
            end
            else
            begin
              if btnBorrar.Enabled then
                btnBorrar.Click;
            end;
      Ord('M'):
            if ssShift in Shift then
            begin
              if btnEditarD.Enabled then
                btnEditarD.Click;
            end
            else
            begin
              if btnEditarC.Enabled then
                btnEditarC.Click;
            end;
      Ord('L'):
            if btnLocalizar.Enabled then
              btnLocalizar.Click;
      vk_f1:
            if btnAceptar.Enabled then
              btnAceptar.Click;
      vk_escape:
            if btnCancelar.Enabled then
              btnCancelar.Click;
      vk_left:
            if btnAnterior.Enabled then
              btnAnterior.Click;
      vk_up:
            if btnPrimero.Enabled then
              btnPrimero.Click;
      vk_right:
            if btnProximo.Enabled then
              btnProximo.Click;
      vk_down:
            if btnUltimo.Enabled then
              btnUltimo.Click;
      Ord('I'):
            if btnImprimir.Enabled then
              btnImprimir.Click;
      Ord('A'):
            if ssShift in Shift then
            begin
              if btnActivar.Enabled then
                btnActivar.Click;
            end;
      Ord('F'):
            if ssShift in Shift then
            begin
              if btnFinalizar.Enabled then
                btnFinalizar.Click;
            end;
      Ord('C'):
            if ssShift in Shift then
            begin
              if btnCrearAlbaran.Enabled then
                btnCrearAlbaran.Click;
            end;
      Ord('D'):
            if ssShift in Shift then
            begin
              if btnBalanza.Enabled then
                btnBalanza.Click;
            end;
    end;
  end
  else
  begin
    case Key of
      vk_f1:
            btnAceptar.Click;
      vk_escape:
            btnCancelar.Click;
    end;
  end;
end;

procedure TFOrdenCarga.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if EstadoActual <> kVisualizar then
  begin
    case Key of
      vk_return, vk_down:
        if not nota_occ.Focused then
            PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
      vk_up:
        if not nota_occ.Focused then
            PostMessage(Handle, WM_NEXTDLGCTL, 1, 0);
      vk_f2:
        DesplegarRejilla( self.ActiveControl );
      vk_f5:
        if cajas_ocl.Focused then
        begin
          bCalculadora.CalculadoraExecute( cajas_ocl );
        end
        else
        if kilos_ocl.Focused then
        begin
          bCalculadora.CalculadoraExecute( kilos_ocl );
        end;
    end;
  end;
end;

procedure TFOrdenCarga.DesplegarRejilla( const AControl: TControl );
var
  sAux: string;
begin
  sAux:= TEdit( AControl ).Text;

  if AControl.Name = fecha_occ.Name then
  begin
    PonFecha( self, AControl, SAux, sAux );
  end
  else
  if AControl.Name = empresa_occ.Name then
  begin
    SeleccionaEmpresa( self, AControl, SAux );
  end
  else
  if ( AControl.Name = centro_salida_occ.Name ) or
     ( AControl.Name = edt_centro_destino_occ.Name )then
  begin
    SeleccionaCentro( self, AControl, empresa_occ.Text, SAux );
  end
  else
  if ( AControl.Name = cliente_sal_occ.Name ) then
  begin
    UFClientes.SeleccionaClientes( self, AControl, empresa_occ.Text, SAux );
  end
  else
  if ( AControl.Name = dir_sum_occ.Name ) then
  begin
    UFSuministros.SeleccionaSuministros( self, AControl, empresa_occ.Text, dir_sum_occ.Text, SAux );
    //SeleccionaSuministro( self, AControl, empresa_occ.Text, cliente_sal_occ.Text, SAux );
  end
  else
  if ( AControl.Name = moneda_occ.Name ) then
  begin
    SeleccionaMoneda( self, AControl, SAux );
  end
  else
  if ( AControl.Name = transporte_occ.Name ) then
  begin
    UFTransportistas.SeleccionaTransportista( self, AControl, empresa_occ.Text, SAux );
  end
  else
  if ( AControl.Name = producto_ocl.Name ) then
  begin
    SeleccionaProducto( self, AControl, empresa_occ.Text, SAux );
  end
  else
  if ( AControl.Name = envase_ocl.Name ) then
  begin
    SeleccionaEnvaseCliente( self, AControl, empresa_occ.Text, producto_ocl.Text, cliente_sal_occ.Text, SAux );
  end
  else
  if ( AControl.Name = marca_ocl.Name ) then
  begin
    SeleccionaMarca( self, AControl, SAux );
  end
  else
  if ( AControl.Name = calibre_ocl.Name ) then
  begin
    SeleccionaCalibre( self, AControl, empresa_occ.Text, producto_ocl.Text, SAux );
  end
  else
  if ( AControl.Name = color_ocl.Name ) then
  begin
    SeleccionaColor( self, AControl, empresa_occ.Text, producto_ocl.Text, SAux );
  end
  else
  if ( AControl.Name = categoria_ocl.Name ) then
  begin
    SeleccionaCategoria( self, AControl, empresa_occ.Text, producto_ocl.Text, SAux );
  end;

  TEdit( AControl ).Text:= sAux;
end;

procedure TFOrdenCarga.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TFOrdenCarga.btnRefrescarClick(Sender: TObject);
begin
  if QOrdenCargaC.Active then
  begin
    if not QOrdenCargaC.IsEmpty then
    begin
      RefrescarOrden( QOrdenCargaCorden_occ.AsString );
    end;
  end;
end;

procedure TFOrdenCarga.Aceptar;
begin
  if QOrdenCargaC.State in [dsInsert, dsEdit] then
  begin
    QOrdenCargaC.Post;
    ActualizarEstado( kVisualizar );
    if EstadoAnterior = kNuevaCabecera then
    begin
      btnAltaD.Click;
    end;
  end
  else
  if QOrdenCargaL.State in [dsInsert, dsEdit] then
  begin
    (*TODO*)
    (*
    if sFacturar = '' then
    begin
      ShowMessage('Envase selccionado no valido para el cliente actual.' + #10 + #10 +
                  'Si es correcto, por favor darlo de alta en el mantenimento de clientes.');
      Exit;
    end;
    *)
    ComprobarEnvase;
    QOrdenCargaL.Post;
    ActualizarEstado( kVisualizar );
    if EstadoAnterior = kNuevoDetalle then
    begin
      btnAltaD.Click;
    end;
  end;
end;

procedure TFOrdenCarga.ComprobarEnvase;
begin
  //Es correcto el envase
  with DOrdenCarga.QAux do
  begin
    Close;
    SQL.Clear;
    SQl.Add(' select * ');
    SQl.Add(' from frf_envases ');
    SQl.Add(' where empresa_e = :empresa ');
    SQl.Add(' and envase_e = :envase ');
    SQl.Add(' and producto_base_e = ');
    SQl.Add(' ( ');
    SQl.Add(' select producto_base_p ');
    SQl.Add(' from frf_productos ');
    SQl.Add(' where empresa_p = :empresa ');
    SQl.Add(' and producto_p = :producto ');
    SQl.Add(' ) ');
    ParamByName('empresa').AsString:= empresa_occ.Text;
    ParamByName('envase').AsString:= envase_ocl.Text;
    ParamByName('producto').AsString:= producto_ocl.Text;
    Open;
    if IsEmpty then
    begin
      Close;
      SQL.Clear;
      SQl.Add(' select * ');
      SQl.Add(' from frf_envases ');
      SQl.Add(' where empresa_e = :empresa ');
      SQl.Add(' and envase_e = :envase ');
      SQl.Add(' and producto_base_e is null ');
      ParamByName('empresa').AsString:= empresa_occ.Text;
      ParamByName('envase').AsString:= envase_ocl.Text;
      Open;
      if IsEmpty then
      begin
        Close;
        raise Exception.Create('La combinaci�n de envase y producto es incorrecta.');
      end;
    end;
    Close;
  end;
end;


procedure TFOrdenCarga.btnAceptarClick(Sender: TObject);
begin
  Aceptar;
  (*
  if not DOrdenCarga.Database.InTransaction then
  begin
    DOrdenCarga.Database.StartTransaction;
    try
      Aceptar;
      DOrdenCarga.Database.Commit;
    except
      DOrdenCarga.Database.Rollback;
      btnCancelar.Click;
      RefrescarOrden( QOrdenCargaCorden_occ.AsString );
      Raise;
    end;
  end;
  *)
end;

procedure TFOrdenCarga.btnCancelarClick(Sender: TObject);
begin
  bEscape:= True;
  if QOrdenCargaC.State in [dsInsert, dsEdit] then
  begin
    QOrdenCargaC.Cancel;
  end
  else
  begin
    if QOrdenCargaL.State in [dsInsert, dsEdit] then
    begin
      QOrdenCargaL.Cancel;
    end;
  end;
  ActualizarEstado( kVisualizar );
end;

procedure TFOrdenCarga.btnAltaClick(Sender: TObject);
begin
  QOrdenCargaC.Insert;
  ActualizarEstado( kNuevaCabecera );
end;

procedure TFOrdenCarga.btnEditarCClick(Sender: TObject);
begin
  QOrdenCargaC.Edit;
  ActualizarEstado( kEditarCabecera );
end;

procedure TFOrdenCarga.btnBorrarClick(Sender: TObject);
begin
  if DOrdenCarga.ComprobarIntegridadOrden( QOrdenCargaCorden_occ.AsInteger ) then
  begin
    BorrarOrdenActual( true );
    ActualizarEstado( kVisualizar );
  end
  else
  begin
    if Application.MessageBox( PCHAR( 'La orden "' + IntToStr( QOrdenCargaCorden_occ.AsInteger ) + '" tiene datos de Packing List asociados.' +
      #13 + #10 + '�Esta seguro que desea borrar la orden seleccionada?   ' + #13 + #10 +
      'NOTA: El Packing List no se borrara.' ), 'AVISO PACKING LIST', mb_yesno ) = idyes then
    begin
      BorrarOrdenActual( false );
      ActualizarEstado( kVisualizar );
    end;
  end;
end;

procedure TFOrdenCarga.btnLocalizarClick(Sender: TObject);
begin
  FiltrarOrdenes;
  ActualizarEstado( kVisualizar );
end;

procedure TFOrdenCarga.btnPrimeroClick(Sender: TObject);
begin
  QOrdenCargaC.DisableControls;
  QOrdenCargaL.Close;
  QOrdenCargaC.First;
  QOrdenCargaL.Open;
  QOrdenCargaC.EnableControls;
  ActualizarEstado( kVisualizar );
end;

procedure TFOrdenCarga.btnAnteriorClick(Sender: TObject);
begin
  QOrdenCargaC.DisableControls;
  QOrdenCargaL.Close;
  QOrdenCargaC.Prior;
  QOrdenCargaL.Open;
  QOrdenCargaC.EnableControls;
  ActualizarEstado( kVisualizar );
end;

procedure TFOrdenCarga.btnProximoClick(Sender: TObject);
begin
  QOrdenCargaC.DisableControls;
  QOrdenCargaL.Close;
  QOrdenCargaC.Next;
  QOrdenCargaL.Open;
  QOrdenCargaC.EnableControls;
  ActualizarEstado( kVisualizar );
end;

procedure TFOrdenCarga.btnUltimoClick(Sender: TObject);
begin
  QOrdenCargaC.DisableControls;
  QOrdenCargaL.Close;
  QOrdenCargaC.Last;
  QOrdenCargaL.Open;
  QOrdenCargaC.EnableControls;
  ActualizarEstado( kVisualizar );
end;

procedure TFOrdenCarga.btnAltaDClick(Sender: TObject);
begin
  QOrdenCargaL.Insert;
  ActualizarEstado( kNuevoDetalle );
end;

procedure TFOrdenCarga.btnEditarDClick(Sender: TObject);
begin
  QOrdenCargaL.Edit;
  ActualizarEstado( kEditarDetalle );
end;

procedure TFOrdenCarga.btnBorrarDClick(Sender: TObject);
begin
  //Integridad con el packing list
  if DOrdenCarga.ComprobarIntegridadLinea( QOrdenCargaLorden_ocl.AsInteger, QOrdenCargaLlinea_ocl.AsInteger,
    QOrdenCargaLempresa_ocl.AsString, QOrdenCargaLproducto_ocl.AsString, QOrdenCargaLenvase_ocl.AsString, 0, 0 ) then
  begin
    BorrarDetalleActual( True );
    ActualizarEstado( kVisualizar );
  end
  else
  begin
    if Application.MessageBox('Integridad con el Packing List rota, hay mas cajas y/o palets en el cami�n que en la orden de carga.' + #13 + #10 +
                              '�Esta seguro de querer continuar con el borrado?      ', 'AVISO PACKING LIST', mb_yesno) = idyes then
    begin
      BorrarDetalleActual( False );
    end;
  end;
end;

procedure TFOrdenCarga.btnImprimirClick(Sender: TObject);
begin
    UQOrdenPackingSimple.VisualizarOrden( self, StrToIntDef( orden_occ.Text, 0 ) );
end;

procedure TFOrdenCarga.OrdenCargaCompleta1Click(Sender: TObject);
begin
  UQOrdenCompleta.VisualizarOrden( self, StrToIntDef( orden_occ.Text, 0 ) , True, True, True, True, True );
end;

procedure TFOrdenCarga.mnuImprimirOrdenClick(Sender: TObject);
begin
  UQOrdenCompleta.VisualizarOrden( self, StrToIntDef( orden_occ.Text, 0 ) , True, False, False, False, False );
end;

procedure TFOrdenCarga.mnuImprimirPackingListClick(Sender: TObject);
begin
  UQOrdenCompleta.VisualizarOrden( self, StrToIntDef( orden_occ.Text, 0 ) , False, True, False, False, False );
end;

procedure TFOrdenCarga.mnuImprimirPackingSimpleClick(Sender: TObject);
begin
  UQOrdenPackingSimple.VisualizarOrden( self, StrToIntDef( orden_occ.Text, 0 ) );
end;

procedure TFOrdenCarga.EnvaseCalibreyColor1Click(Sender: TObject);
begin
  UQOrdenCompleta.VisualizarOrden( self, StrToIntDef( orden_occ.Text, 0 ) , False, False, False, True, False );
end;

procedure TFOrdenCarga.EnvasesLogifruit1Click(Sender: TObject);
begin
  UQOrdenCompleta.VisualizarOrden( self, StrToIntDef( orden_occ.Text, 0 ) , False, False, True, False, False );
end;

procedure TFOrdenCarga.ipoPalets1Click(Sender: TObject);
begin
  UQOrdenCompleta.VisualizarOrden( self, StrToIntDef( orden_occ.Text, 0 ) , False, False, False, False, True );
end;

procedure TFOrdenCarga.CrearAlbaran( const APacking: Boolean );
var
  DTraspasar: TDTraspasar;
  bTraspasar: boolean;
  iReferencia: integer;
begin
  if QOrdenCargaCtraspasada_occ.AsInteger = 0 then
  begin
    bTraspasar:= Application.MessageBox('�Seguro que quiere generar el ALBAR�N DE SALIDA?   ',
         'GENERAR ALBAR�N.', mb_yesno ) = idyes;
  end
  else
  begin
    bTraspasar:= Application.MessageBox('La orden ya ha sido traspasada.' + #13 + #10 +
      '�Seguro que quiere volver a generar el ALBAR�N DE SALIDA?   ', 'GENERAR ALBAR�N.', mb_yesno ) = idyes;
  end;

  if bTraspasar then
  begin
    DTraspasar:= TDTraspasar.Create( self );
    try
      if not DOrdenCarga.Database.InTransaction then
      begin
        DOrdenCarga.Database.StartTransaction;
        try
          iReferencia:= DTraspasar.PasarAlbaran( QOrdenCargaCempresa_occ.AsString, QOrdenCargaCcentro_salida_occ.AsString,
            QOrdenCargaCfecha_occ.AsDateTime, QOrdenCargaCorden_occ.AsInteger, APacking );
          DOrdenCarga.Database.Commit;
          ShowMessage('Salida ' + IntToStr( iReferencia  )  + ' generada con exito.');
        except
          DOrdenCarga.Database.Rollback;
          Raise;
        end;
      end;
    finally
      FreeAndNil( DTraspasar );
    end;
    RefrescarOrden( QOrdenCargaCorden_occ.AsString );
    HabilitarBarra;
  end;
end;

function TFOrdenCarga.ValidarTransito:boolean;
begin
  result:= false;

  if st_planta_origen_occ.Caption = '' then
  begin
    ShowMessage('Falta codigo planta origen o es incorrecto.');
    Exit;
  end;

  if st_centro_origen_occ.Caption = '' then
  begin
    ShowMessage('Falta codigo centro origen o es incorrecto.');
    Exit;
  end;

  if st_planta_destino_occ.Caption = '' then
  begin
    ShowMessage('Falta codigo planta destino o es incorrecto.');
    Exit;
  end;

  if st_centro_destino_occ.Caption = '' then
  begin
    ShowMessage('Falta codigo centro destino o es incorrecto.');
    Exit;
  end;

  result:= true;
end;

procedure TFOrdenCarga.CrearTransito( const APacking: Boolean );
var
  DTraspasar: TDTraspasar;
  bTraspasar: boolean;
  iReferencia: integer;
begin
  if QOrdenCargaCtraspasada_occ.AsInteger = 0 then
  begin
    bTraspasar:= Application.MessageBox('�Seguro que quiere generar el TR�NSITO?   ',
         'GENERAR TR�NSITO.', mb_yesno ) = idyes;
  end
  else
  begin
    bTraspasar:= Application.MessageBox('La orden ya ha sido traspasada.' + #13 + #10 +
      '�Seguro que quiere volver a generar el TR�NSITO?   ', 'GENERAR TR�NSITO.', mb_yesno ) = idyes;
  end;

  if bTraspasar then
  begin
    DTraspasar:= TDTraspasar.Create( self );
    try
      if not DOrdenCarga.Database.InTransaction then
      begin
        DOrdenCarga.Database.StartTransaction;
        try
          iReferencia:= DTraspasar.PasarTransito( QOrdenCargaCempresa_occ.AsString, QOrdenCargaCcentro_salida_occ.AsString,
            QOrdenCargaCfecha_occ.AsDateTime, QOrdenCargaCorden_occ.AsInteger, APacking );
          DOrdenCarga.Database.Commit;
          ShowMessage('Tr�nsito ' + IntToStr( iReferencia  )  + ' generado con exito.');
        except
          DOrdenCarga.Database.Rollback;
          Raise;
        end;
      end;
    finally
      FreeAndNil( DTraspasar );
    end;
    RefrescarOrden( QOrdenCargaCorden_occ.AsString );
    HabilitarBarra;
  end;
end;

procedure TFOrdenCarga.btnActivarClick(Sender: TObject);
begin
  if Application.MessageBox('�Esta seguro que quiere activar la orden?, a partir de ese momento se inicializara la carga.','ACTIVAR ORDEN', MB_YESNO ) = IDYES then
  begin
    DOrdenCarga.CambiarEstado( QOrdenCargaCorden_occ.AsInteger, 1);
    RefrescarOrden( QOrdenCargaCorden_occ.AsString );
    HabilitarBarra;
  end;
end;

procedure TFOrdenCarga.btnFinalizarClick(Sender: TObject);
var
  sAux: string;
begin
  if ( QOrdenCargaCstatus_occ.AsInteger = 1 ) or ( QOrdenCargaCstatus_occ.AsInteger = 2 ) then
  begin
    if not DOrdenCarga.ComprobarIntegridad( QOrdenCargaCempresa_occ.AsString, QOrdenCargaCorden_occ.AsInteger, sAux ) then
    begin
      if Application.MessageBox(Pchar( sAux +  '�Esta seguro que quiere finalizar la orden?   '),
             'FINALIZAR ORDEN.', mb_yesno ) = idyes then
      begin
        PonFinalizada;
      end
    end
    else
    begin
      PonFinalizada;
    end;
  end
  else
  if ( QOrdenCargaCstatus_occ.AsInteger = 3) then
  begin
    if QOrdenCargaCtraspasada_occ.AsInteger <> 0 then
    begin
      if Application.MessageBox(Pchar( 'El albar�n de salida/tr�nsito ya ha sido creado.' + #13 + #10 +
                                       '�Esta seguro que quiere desfinalizar la orden?   '),
                                       'DESFINALIZAR ORDEN.', mb_yesno ) = idyes then
      begin
        PonInicializada;
      end;
    end
    else
    begin
      if DOrdenCarga.ComprobarIntegridad( QOrdenCargaCempresa_occ.AsString, QOrdenCargaCorden_occ.AsInteger, sAux ) then
      begin
        if Application.MessageBox(Pchar( 'La orden de carga coincide con el packing creado.' + #13 + #10 +
                                         '�Esta seguro que quiere desfinalizar la orden?   '),
                                         'DESFINALIZAR ORDEN.', mb_yesno ) = idyes then
        begin
          PonInicializada;
        end
      end
      else
      begin
        PonInicializada;
      end;
    end;
  end;
end;

procedure TFOrdenCarga.btnCrearAlbaranClick(Sender: TObject);
var
  sAux: string;
begin
  if not DOrdenCarga.ComprobarIntegridad( QOrdenCargaCempresa_occ.AsString, QOrdenCargaCorden_occ.AsInteger, sAux ) then
  begin
    ShowMessage( sAux );
  end
  else
  begin
    if pgcDestino.ActivePage =  tsSalida then
    begin
      CrearAlbaran( True );
    end
    else
    begin
      if ValidarTransito then
        CrearTransito( True );
    end;
  end;
end;

procedure TFOrdenCarga.mnuIgnorarPackingClick(Sender: TObject);
begin
  if pgcDestino.ActivePage =  tsSalida then
  begin
    CrearAlbaran( False );
  end
  else
  begin
    if ValidarTransito then
      CrearTransito( False );
  end;
end;

procedure TFOrdenCarga.mnuUnirAlbaranClick(Sender: TObject);
begin
  if Trim( orden_occ.Text ) <> '' then
  begin
    if pgcDestino.ActivePage =  tsSalida then
    begin
      UnirAlbaran;
    end
    else
    begin
      UnirTransito;
    end;
  end;
end;

procedure TFOrdenCarga.btnBalanzaClick(Sender: TObject);
begin
  if not DSMaestro.DataSet.IsEmpty then
    UFDistribuirPeso.Execute( self,
                              DSMaestro.DataSet.FieldByName('orden_occ').AsInteger,
                              DOrdenCarga.Database.DatabaseName );
  RefrescarOrden( QOrdenCargaCorden_occ.AsString );
end;

procedure TFOrdenCarga.PonInicializada;
begin
  //if Application.MessageBox('�Esta seguro que quiere desfinalizar la orden?','DESFINALIZAR ORDEN', MB_YESNO ) = IDYES then
  //begin
    DOrdenCarga.DesfinalizarOrden( QOrdenCargaCorden_occ.AsInteger );
    //DOrdenCarga.CambiarEstado( QOrdenCargaCorden_occ.AsInteger, 2);
    RefrescarOrden( QOrdenCargaCorden_occ.AsString );
    HabilitarBarra;
  //end;
end;

procedure TFOrdenCarga.PonFinalizada;
begin
  //if Application.MessageBox('�Esta seguro que quiere finalizar la orden?','FINALIZAR ORDEN', MB_YESNO ) = IDYES then
  //begin
    DOrdenCarga.CambiarEstado( QOrdenCargaCorden_occ.AsInteger, 3);
    RefrescarOrden( QOrdenCargaCorden_occ.AsString );
    HabilitarBarra;
  //end;
end;

procedure TFOrdenCarga.mnuFiltroClick(Sender: TObject);
begin
  TMenuItem( Sender ).Checked:= not TMenuItem( Sender ).Checked;
  ConstruirFiltro;
end;

procedure TFOrdenCarga.ActualizarEstado( const AEstado: integer );
var
  sOrden: string;
begin
  EstadoAnterior:= EstadoActual;
  EstadoActual:= AEstado;
  sOrden:= orden_occ.Text;

  case AEstado of
    kVisualizar:
    begin
      Visualizar;
      if not bEscape then
      begin
        if ( EstadoAnterior = kNuevaCabecera ) then
        begin
          VisualizarOrden( sOrden );
        end
        else
        if ( EstadoAnterior = kEditarCabecera )  then
        begin
          RefrescarOrden( sOrden );
        end
        else
        if ( EstadoAnterior = kEditarDetalle ) or ( EstadoAnterior = kNuevoDetalle ) then
        begin
          RefrescarDetalle;
        end;
      end
      else
      begin
        bEscape:= false;
      end;
    end;
    kNuevaCabecera: EditarC;
    kEditarCabecera: EditarC;
    kNuevoDetalle: EditarD;
    kEditarDetalle: EditarD;
  end;
end;

procedure TFOrdenCarga.HabilitarBarra;
begin
  btnAlta.Enabled:= QOrdenCargaC.Active;
  btnEditarC.Enabled:= QOrdenCargaC.Active and ( not QOrdenCargaC.IsEmpty )
    and ( QOrdenCargaCstatus_occ.AsInteger in [0,1,2] );
  btnBorrar.Enabled:= QOrdenCargaC.Active and ( not QOrdenCargaC.IsEmpty )
    and ( QOrdenCargaCstatus_occ.AsInteger in [0,1,2,3] )
    and ( QOrdenCargaCtraspasada_occ.AsInteger = 0 );
  btnLocalizar.Enabled:= True;

  btnAltaD.Enabled:= QOrdenCargaC.Active and ( not QOrdenCargaC.IsEmpty )
    and ( QOrdenCargaCstatus_occ.AsInteger in [0,1,2] );
  btnBorrarD.Enabled:= QOrdenCargaC.Active and ( not QOrdenCargaC.IsEmpty ) and ( not QOrdenCargaL.IsEmpty )
    and ( QOrdenCargaCstatus_occ.AsInteger in [0,1,2] );
  btnEditarD.Enabled:= QOrdenCargaC.Active and ( not QOrdenCargaC.IsEmpty ) and ( not QOrdenCargaL.IsEmpty )
    and ( QOrdenCargaCstatus_occ.AsInteger in [0,1,2] );

  btnPrimero.Enabled:= QOrdenCargaC.Active and ( not QOrdenCargaC.Bof );
  btnAnterior.Enabled:= QOrdenCargaC.Active and ( not QOrdenCargaC.Bof );
  btnProximo.Enabled:= QOrdenCargaC.Active and ( not QOrdenCargaC.Eof );
  btnUltimo.Enabled:= QOrdenCargaC.Active and ( not QOrdenCargaC.Eof );

  btnResumen.Enabled:= not QOrdenCargaC.IsEmpty;
  btnImprimir.Enabled:= not QOrdenCargaC.IsEmpty;

  btnActivar.Enabled:= ( not QOrdenCargaC.IsEmpty ) and ( QOrdenCargaCstatus_occ.AsInteger = 0 );
  btnFinalizar.Enabled:= ( not QOrdenCargaC.IsEmpty ) and ( QOrdenCargaCstatus_occ.AsInteger in [1,2,3] );
  //btnCrearAlbaran.Enabled:= True;
  btnCrearAlbaran.Enabled:= ( not QOrdenCargaC.IsEmpty ) and ( QOrdenCargaCstatus_occ.AsInteger = 3 ) and
                            ( QOrdenCargaCtraspasada_occ.AsInteger = 0 );
  btnBalanza.Enabled:= ( not QOrdenCargaC.IsEmpty ) and ( QOrdenCargaCstatus_occ.AsInteger in [1,2,3] ) and
                            ( QOrdenCargaCtraspasada_occ.AsInteger = 0 );

  case QOrdenCargaCstatus_occ.AsInteger of
    1,2:
    begin
      btnFinalizar.ImageIndex:= 18;
      btnFinalizar.Hint:= 'Finalizar Orden (Mayus F)';
    end;
    3:
    begin
      btnFinalizar.ImageIndex:= 17;
      btnFinalizar.Hint:= 'Desfinalizar Orden (Mayus F)';
    end;
  end;

(*
  btnCancelar.Enabled:= False;
  btnAceptar.Enabled:= False;
  btnCerrar.Enabled:= True;
*)
  btnCancelar.OnClick:= btnCerrarClick;
  btnAceptar.OnClick:= btnRefrescarClick;
  btnAceptar.Enabled:= ( not QOrdenCargaC.IsEmpty );
  btnCancelar.hint:= 'Cerrar (Esc)';
  btnAceptar.hint:= 'Refrescar (F1)';
  btnCancelar.ImageIndex:= 14;
  btnAceptar.ImageIndex:= 19;
end;

procedure TFOrdenCarga.DesHabilitarBarra;
begin
  btnAlta.Enabled:= False;
  btnEditarC.Enabled:= False;
  btnBorrar.Enabled:= False;
  btnLocalizar.Enabled:= False;

  btnAltaD.Enabled:= False;
  btnBorrarD.Enabled:= False;
  btnEditarD.Enabled:= False;

  btnPrimero.Enabled:= False;
  btnAnterior.Enabled:= False;
  btnProximo.Enabled:= False;
  btnUltimo.Enabled:= False;

  btnResumen.Enabled:= False;
  btnImprimir.Enabled:= False;
  //btnCrearAlbaran.Enabled:= True;
  btnCrearAlbaran.Enabled:= False;
  btnBalanza.Enabled:= False;
  (* ( not QOrdenCargaC.IsEmpty ) and ( QOrdenCargaCstatus_occ.AsInteger in [1,2,3] ) and
                            ( QOrdenCargaCtraspasada_occ.AsInteger = 0 );
  *)
  btnActivar.Enabled:= False;
  btnFinalizar.Enabled:= False;

(*
  btnCancelar.Enabled:= True;
  btnAceptar.Enabled:= True;
  btnCerrar.Enabled:= False;
*)
  btnCancelar.OnClick:= btnCancelarClick;
  btnAceptar.OnClick:= btnAceptarClick;
  btnCancelar.hint:= 'Cancelar (Esc)';
  btnAceptar.Enabled:= True;
  btnAceptar.hint:= 'Aceptar (F1)';
  btnCancelar.ImageIndex:= 13;
  btnAceptar.ImageIndex:= 12;
end;

procedure TFOrdenCarga.Visualizar;
begin
  PMaestro.Enabled:= False;
  PDetalle.Enabled:= False;
  PDetalle.Height:= 0;
  RVisualizacion.Enabled:= True;

  HabilitarBarra;
end;

procedure TFOrdenCarga.EditarC;
begin
  PMaestro.Enabled:= True;
  PDetalle.Enabled:= False;
  PDetalle.Height:= 0;
  RVisualizacion.Enabled:= False;

  DesHabilitarBarra;

  if edt_planta_destino_occ.CanFocus then
    edt_planta_destino_occ.SetFocus
  else
    cliente_sal_occ.SetFocus;
end;

procedure TFOrdenCarga.EditarD;
begin
  PMaestro.Enabled:= False;
  PDetalle.Enabled:= True;
  PDetalle.Height:= 160;
  RVisualizacion.Enabled:= False;

  DesHabilitarBarra;

  if EstadoActual = kNuevoDetalle then
  begin
    if producto_ocl.CanFocus then
    begin
      producto_ocl.SetFocus
    end;
    rKilosAnterior:= 0;
  end
  else
  begin
    if cajas_ocl.CanFocus then
      cajas_ocl.SetFocus;
    rKilosAnterior:= QOrdenCargaLkilos_ocl.AsFloat;
    envase_ocl.Change;
  end;
end;

procedure TFOrdenCarga.QOrdenCargaCNewRecord(DataSet: TDataSet);
begin
  with DOrdenCarga do
  begin
    //Obtener y actualizar contador de ordenes
    QGetNumeroOrden.Open;
    QOrdenCargaCorden_occ.AsInteger:= QGetNumeroOrden.FieldByName('contador_oc').AsInteger;
    orden_occ.Text:= QOrdenCargaCorden_occ.AsString;
    QGetNumeroOrden.Close;
    QUpdateNumeroOrden.ParamByName('contador').AsInteger:= QOrdenCargaCorden_occ.AsInteger + 1;
    QUpdateNumeroOrden.ExecSQL;

    //Datos por defecto
    QOrdenCargaCstatus_occ.AsInteger:= 0;
    QOrdenCargaCtraspasada_occ.AsInteger:= 0;
    QOrdenCargaCempresa_occ.AsString:= gsEmpresa;
    QOrdenCargaCplanta_origen_occ.AsString:= gsEmpresa;
    QOrdenCargaCcentro_salida_occ.AsString:= gsCentro;
    QOrdenCargaCn_albaran_occ.AsInteger:= QOrdenCargaCorden_occ.AsInteger;
    QOrdenCargaCfecha_occ.AsDateTime:= Date;
    QOrdenCargaChora_occ.AsString:= FormatDateTime('hh:nn', Time );
    QOrdenCargaCporte_bonny_occ.AsInteger:= 0;
    porte_bonny_occ.Checked:= False;
    QOrdenCargaChigiene_occ.AsInteger:= 1;
    higiene_occ.Checked:= True;
    QOrdenCargaCn_palets_occ.AsInteger:= 0;
  end;
end;

procedure TFOrdenCarga.QOrdenCargaCCalcFields(DataSet: TDataSet);
begin
  case QOrdenCargaCtraspasada_occ.AsInteger of
    1:
    begin
      QOrdenCargaCdes_traspasada_occ.AsString:= 'ALBAR�N CREADO N� ' + QOrdenCargaCn_albaran_occ.AsString;
      QOrdenCargaCdes2_traspasada_occ.AsString:= 'ALBA';
    end;
    2:
    begin
      QOrdenCargaCdes_traspasada_occ.AsString:= 'TR�NSITO CREADO N� ' + QOrdenCargaCn_albaran_occ.AsString;
      QOrdenCargaCdes2_traspasada_occ.AsString:= 'TRAN';
    end;
    else
    begin
      QOrdenCargaCdes_traspasada_occ.AsString:= '';
      QOrdenCargaCdes2_traspasada_occ.AsString:= '';
    end;
  end;
  case QOrdenCargaCstatus_occ.AsInteger of
    0:
    begin
      QOrdenCargaCdes_status_occ.AsString:= 'CREADA';
      QOrdenCargaCdes2_status_occ.AsString:= 'CREA';
    end;
    1:
    begin
       QOrdenCargaCdes_status_occ.AsString:= 'ACTIVA';
       QOrdenCargaCdes2_status_occ.AsString:= 'ACTI';
    end;
    2:
    begin
      QOrdenCargaCdes_status_occ.AsString:= 'INICIALIZADA';
      QOrdenCargaCdes2_status_occ.AsString:= 'INIC';
    end;
    3:
    begin
      QOrdenCargaCdes_status_occ.AsString:= 'FINALIZADA';
      QOrdenCargaCdes2_status_occ.AsString:= 'FINA';
    end;
    else
    begin
      QOrdenCargaCdes_status_occ.AsString:= '';
      QOrdenCargaCdes2_status_occ.AsString:= '';
    end;
  end;

  QOrdenCargaCdes_suministro_occ.AsString:= QOrdenCargaCdir_sum_occ.AsString;
  QOrdenCargaCpalets_cargados_occ.AsInteger:= 0;

  try
    if QOrdenCargaCstatus_occ.AsInteger > 1 then
    begin
      QPalets.ParamByName('orden').AsInteger:= QOrdenCargaCorden_occ.AsInteger;
      QPalets.Open;
      QOrdenCargaCpalets_cargados_occ.AsInteger:= QPalets.Fields[0].AsInteger;
      QPalets.Close;
    end
    else
    begin
      QOrdenCargaCpalets_cargados_occ.AsInteger:= 0;
    end;
  finally
    QPalets.Close;
  end;

  if not ( QOrdenCargaC.State in [dsEdit, dsInsert] ) then
  begin
    QOrdenCargaCdes_suministro_occ.AsString:= DDescripciones.desSuministro( QOrdenCargaCempresa_occ.AsString,
      QOrdenCargaCcliente_sal_occ.AsString, QOrdenCargaCdir_sum_occ.AsString );
  end;
end;

procedure TFOrdenCarga.BorrarOrdenActual( const APreguntar: Boolean );
begin
  //Borrar detalle
  if ( not APreguntar ) or ( Application.MessageBox(PCHAR( 'Seguro que quiere borrar la orden n�. ' + QOrdenCargaCorden_occ.AsString ),
                            'BORRAR ORDEN', MB_YESNO ) = IDYES ) then
  begin
    with DOrdenCarga.QBorrarDetalle do
    begin
      ParamByName('contador').AsInteger:= QOrdenCargaCorden_occ.AsInteger;
      ExecSQL;
    end;
    with DOrdenCarga.QBorrarPacking do
    begin
      ParamByName('contador').AsInteger:= QOrdenCargaCorden_occ.AsInteger;
      ExecSQL;
    end;
    //Borrar cabecera activa
    QOrdenCargaC.Delete;
  end;
end;

procedure TFOrdenCarga.BorrarDetalleActual( const APreguntar: Boolean );
begin
  if ( not APreguntar  ) or ( Application.MessageBox(PCHAR( 'Seguro que quiere borrar la linea activa.' ),
                            'BORRAR ORDEN', MB_YESNO ) = IDYES ) then
  begin
    //Borrar detalle activo
    QOrdenCargaL.Delete;
  end;
end;

procedure TFOrdenCarga.FiltrarOrdenes;
var
  FFIltro: TFFiltro;
begin
  FFIltro:= TFFiltro.Create( self );

  try
    if FFiltro.ShowModal = mrOk then
    begin
      sFiltro := FFiltro.GetFiltro;
      with QOrdenCargaC do
      begin
        Close;
        SQL.Clear;
        SQL.Add(' select * ');
        SQL.Add(' from frf_orden_carga_c ');
        SQL.Add(sFiltro);
        SQL.Add(' order by fecha_occ desc, status_occ, orden_occ desc ');
        try
          //Timer.Enabled:= False;
          QOrdenCargaC.DisableControls;
          Open;
        finally
          //Timer.Enabled:= True;
          QOrdenCargaC.EnableControls;
        end;
      end;
    end;
  finally
    FreeAndNil( FFiltro );
  end;
end;

procedure TFOrdenCarga.VisualizarOrden( const AOrden: string );
begin
  with QOrdenCargaC do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' select * ');
    SQL.Add(' from frf_orden_carga_c ');
    if AOrden <> '' then
    begin
      sFiltro:=  ' where orden_occ = ' + AOrden;
      SQL.Add( sFiltro );
    end;

    try
      //Timer.Enabled:= False;
      QOrdenCargaC.DisableControls;
      Open;
    finally
      //Timer.Enabled:= True;
      QOrdenCargaC.EnableControls;
    end;
  end;
end;

procedure TFOrdenCarga.RefrescarOrden( const AOrden: string );
begin
  with QOrdenCargaC do
  begin
    Close;
    try
      //Timer.Enabled:= False;
      QOrdenCargaC.DisableControls;
      Open;
      Locate('orden_occ', AOrden, []);
      HabilitarBarra;
    finally
      //Timer.Enabled:= True;
      QOrdenCargaC.EnableControls;
    end;
  end;
end;

procedure TFOrdenCarga.RefrescarDetalle;
begin
  with QOrdenCargaL do
  begin
    Close;
    Open;
  end;
end;

procedure TFOrdenCarga.empresa_occChange(Sender: TObject);
begin
  edt_planta_origen_occ.Text:= empresa_occ.Text;
  STempresa_occ.Caption:= DDescripciones.desEmpresa( empresa_occ.Text );
  st_planta_origen_occ.Caption:= STempresa_occ.Caption;
  STcentro_salida_occ.Caption:= DDescripciones.desCentro( empresa_occ.Text, centro_salida_occ.Text );
  st_centro_origen_occ.Caption:= STcentro_salida_occ.Caption;

  if pgcDestino.ActivePage = tsSalida then
  begin
    //STcliente_sal_occ.Caption:= DDescripciones.desCliente( empresa_occ.Text, cliente_sal_occ.Text );
    cliente_sal_occChange( cliente_sal_occ );
    STdir_sum_occ.Caption:= DDescripciones.desSuministro( empresa_occ.Text, cliente_sal_occ.Text, dir_sum_occ.Text );
    STmoneda_occ.Caption:= DDescripciones.desMoneda( moneda_occ.Text );
  end
  else
  begin
    ST_planta_destino_occ.Caption:= DDescripciones.desEmpresa( edt_planta_destino_occ.Text );
    ST_centro_destino_occ.Caption:= DDescripciones.desCentro( edt_planta_destino_occ.Text, edt_centro_destino_occ.Text );
  end;

  STtransporte_occ.Caption:= DDescripciones.desTransporte( empresa_occ.Text, transporte_occ.Text );
  SToperador_transporte_occ.Caption:= DDescripciones.desTransporte( empresa_occ.Text, operador_transporte_occ.Text );
end;

procedure TFOrdenCarga.centro_salida_occChange(Sender: TObject);
begin
  STcentro_salida_occ.Caption:= DDescripciones.desCentro( empresa_occ.Text, centro_salida_occ.Text );
  st_centro_origen_occ.Caption:= STcentro_salida_occ.Caption;
end;

procedure TFOrdenCarga.edt_planta_destino_occChange(Sender: TObject);
begin
  ST_planta_destino_occ.Caption:= DDescripciones.desEmpresa( edt_planta_destino_occ.Text );
  ST_centro_destino_occ.Caption:= DDescripciones.desCentro( edt_planta_destino_occ.Text, edt_centro_destino_occ.Text );
end;

procedure TFOrdenCarga.edt_centro_destino_occChange(Sender: TObject);
begin
  ST_centro_destino_occ.Caption:= DDescripciones.desCentro( edt_planta_destino_occ.Text, edt_centro_destino_occ.Text );
end;

procedure TFOrdenCarga.cliente_sal_occChange(Sender: TObject);
begin
  if QOrdenCargaC.State in [dsInsert, dsEdit] then
  begin
    QOrdenCargaCcliente_fac_occ.Value:= cliente_sal_occ.Text;
    QOrdenCargaCmoneda_occ.AsString:= DOrdenCarga.GetMonedaCliente(
      QOrdenCargaCempresa_occ.AsString, cliente_sal_occ.Text);

    STcliente_sal_occ.Caption:= DDescripciones.desCliente( empresa_occ.Text, cliente_sal_occ.Text );
    (*
    if STcliente_sal_occ.Caption <> '' then
    if ( nota_occ.Text = '' ) then
    begin
      if ( empresa_occ.Text = 'F18' ) then
      begin
        nota_occ.Lines.Add('TEMPERATURA ENTRE 1� y 4� C');
        nota_occ.Lines.Add('TEMPERATURA SALIDA PRODUCTO');
      end
      else
      begin
        if ( empresa_occ.Text = 'F21' ) then
        begin
          nota_occ.Lines.Add('TEMPERATURA OPTIMA DE +8 A +12 GRADOS.');
          nota_occ.Lines.Add('FURGON PRE-ENFRIADO : SI');
        end
        else
        begin
          //if cliente_sal_occ.Text = 'MER' then
          begin
            nota_occ.Lines.Add('TEMPERATURA �PTIMA 12 GRADOS.');
            nota_occ.Lines.Add('EQUIPO FR�O EN FUNCIONAMIENTO: SI.');
          end;
        end;
      end;
    end;
    *)
    if STcliente_sal_occ.Caption <> '' then
    begin
      (*
      if not DOrdenCarga.TieneSuministros( empresa_occ.Text, cliente_sal_occ.Text  ) then
      begin
        dir_sum_occ.Text:= cliente_sal_occ.Text;
      end;
      *)
      dir_sum_occ.Text:= cliente_sal_occ.Text;
    end;

    if QOrdenCargaC.State in [dsEdit, dsInsert] then
    begin
      STdir_sum_occ.Caption:= DDescripciones.desSuministro( empresa_occ.Text, cliente_sal_occ.Text, dir_sum_occ.Text );
    end;
  end
  else
  begin
    STcliente_sal_occ.Caption:= DDescripciones.desCliente( empresa_occ.Text, cliente_sal_occ.Text );
    STdir_sum_occ.Caption:= DDescripciones.desSuministro( empresa_occ.Text, cliente_sal_occ.Text, dir_sum_occ.Text );
  end;

  if Trim( cliente_sal_occ.Text ) = '' then
  begin
    if ( QOrdenCargaC.Active ) and ( QOrdenCargaC.state in [ dsInsert, dsEdit ] ) then
    begin
      QOrdenCargaCcliente_sal_occ.Clear;
      QOrdenCargaCdir_sum_occ.Clear;
      QOrdenCargaCcliente_fac_occ.Clear;
      QOrdenCargaCmoneda_occ.Clear;
      QOrdenCargaCn_pedido_occ.Clear;
    end;
    cliente_sal_occ.Text:= '';
    dir_sum_occ.Text:= '';
    moneda_occ.Text:= '';
    n_pedido_occ.Text:= '';

  end
  else
  begin
    if ( QOrdenCargaC.Active ) and ( QOrdenCargaC.state in [ dsInsert, dsEdit ] ) then
    begin
      QOrdenCargaCcentro_destino_occ.Clear;
    end;
    edt_centro_destino_occ.Text:= '';

  end;
end;

procedure TFOrdenCarga.dir_sum_occChange(Sender: TObject);
begin
  STdir_sum_occ.Caption:= DDescripciones.desSuministro( empresa_occ.Text, cliente_sal_occ.Text, dir_sum_occ.Text );
  if QOrdenCargaC.State in [dsInsert, dsEdit] then
  begin
    if STDir_sum_occ.Caption <> '' then
    if ( nota_occ.Text = '' )  then
    begin
      if ( empresa_occ.Text = 'F18' ) then
      begin
        nota_occ.Lines.Add('TEMPERATURA ENTRE 1� y 4� C');
        nota_occ.Lines.Add('TEMPERATURA SALIDA PRODUCTO');
      end
      else
      begin
        if ( empresa_occ.Text = 'F21' ) then
        begin
          nota_occ.Lines.Add('TEMPERATURA OPTIMA DE +8 A +12 GRADOS.');
          nota_occ.Lines.Add('FURGON PRE-ENFRIADO : SI');
        end
        else
        begin
          //if cliente_sal_occ.Text = 'MER' then
          begin
            nota_occ.Lines.Add('TEMPERATURA �PTIMA 12 GRADOS.');
            nota_occ.Lines.Add('EQUIPO FR�O EN FUNCIONAMIENTO: SI.');
          end;
        end;
      end;
      if ( empresa_occ.Text = '050' ) and ( cliente_sal_occ.Text = 'MER' ) and ( dir_sum_occ.Text = '2MN' ) then
      begin
        nota_occ.Lines.Add(UpperCase('La mercanc�a transportada realiza tr�fico mar�timo entre islas'));
      end;
    end;
  end;
end;

procedure TFOrdenCarga.moneda_occChange(Sender: TObject);
begin
  STmoneda_occ.Caption:= DDescripciones.desMoneda( moneda_occ.Text );
end;

procedure TFOrdenCarga.transporte_occChange(Sender: TObject);
begin
  STtransporte_occ.Caption:= DDescripciones.desTransporte( empresa_occ.Text, transporte_occ.Text );
end;

procedure TFOrdenCarga.operador_transporte_occChange(Sender: TObject);
begin
  SToperador_transporte_occ.Caption:= DDescripciones.desTransporte( empresa_occ.Text, operador_transporte_occ.Text );
end;

procedure TFOrdenCarga.producto_oclChange(Sender: TObject);
begin
  STProducto_ocl.Caption:= DDescripciones.desProducto( empresa_occ.Text, producto_ocl.Text );
  STCategoria_ocl.Caption:= DDescripciones.desCategoria( empresa_occ.Text, producto_ocl.Text, categoria_ocl.Text );
  STColor_ocl.Caption:= DDescripciones.desColor( empresa_occ.Text, producto_ocl.Text, color_ocl.Text );
  if envase_ocl.Text <> '' then
    envase_oclChange( envase_ocl );
end;

function desUnidad( const ATipoUnidad: String ): String;
begin
  if ATipoUnidad = 'K' then
  begin
    result:= 'KGS';
  end
  else
  if ATipoUnidad = 'C' then
  begin
    result:= 'CAJ';
  end
  else
  if ATipoUnidad = 'U' then
  begin
    result:= 'UND';
  end
  else
  begin
    result:= '';
  end;
end;

procedure TFOrdenCarga.envase_oclChange(Sender: TObject);
var
  sDescripcion: string;
begin
  STEnvase_ocl.Caption:= DDescripciones.desEnvaseClienteEx( empresa_occ.Text, producto_ocl.Text, envase_ocl .Text, cliente_sal_occ.Text );

  DOrdenCarga.DatosEnvaseCliente( empresa_occ.Text, producto_ocl.Text, envase_ocl .Text, cliente_sal_occ.Text,
    bPesoVariable, rPesoCaja, iUnidadesCaja, sFacturar, sDescripcion);

  if sFacturar = '' then
  begin
    sFacturar:= 'K';
  end;

  if producto_ocl.Text = '' then
  begin
    porc_iva_ocl.Text:= '';
  end
  else
  begin
    case DOrdenCarga.TipoIvaEnvaseProducto( empresa_occ.Text, envase_ocl.Text, producto_ocl.Text ) of
      0: porc_iva_ocl.Text:= FloatToStr( rImpuestosActual.rSuper );
      1: porc_iva_ocl.Text:= FloatToStr( rImpuestosActual.rReducido );
      2: porc_iva_ocl.Text:= FloatToStr( rImpuestosActual.rGeneral );
    end;
  end;

  unidad_precio_ocl.Text:= desUnidad( sFacturar );
  //ActualizarValores;
  ActualizarValoresCantidad;
  if QOrdenCargaL.State in [dsInsert, dsEdit] then
  begin
    QOrdenCargaLcajas_ocl.AsInteger:= ICajas;
    //if not bPesoVariable then
    QOrdenCargaLkilos_ocl.AsFloat:= rKilos;
    QOrdenCargaLimporte_neto_ocl.AsFloat:= rImporte;
    QOrdenCargaLiva_ocl.AsFloat:= rIva;
    QOrdenCargaLimporte_total_ocl.AsFloat:= rTotal;
  end;
end;

procedure TFOrdenCarga.marca_oclChange(Sender: TObject);
begin
  STMarca_ocl.Caption:= DDescripciones.desMarca( marca_ocl.Text );
end;

procedure TFOrdenCarga.categoria_oclChange(Sender: TObject);
begin
  STCategoria_ocl.Caption:= DDescripciones.desCategoria( empresa_occ.Text, producto_ocl.Text, categoria_ocl.Text );
end;

procedure TFOrdenCarga.color_oclChange(Sender: TObject);
begin
  STColor_ocl.Caption:= DDescripciones.desColor( empresa_occ.Text, producto_ocl.Text, color_ocl.Text );
end;

procedure TFOrdenCarga.tipo_palets_oclChange(Sender: TObject);
begin
  stTipoPalet.Caption:= DDescripciones.desTipoPalet( tipo_palets_ocl.Text );
end;

procedure TFOrdenCarga.BGBEmpresa_occClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= empresa_occ.Text;
  if SeleccionaEmpresa( self, empresa_occ, sAux ) then
    empresa_occ.Text:= sAux;
end;

procedure TFOrdenCarga.btn_planta_destino_occClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= edt_planta_destino_occ.Text;
  if SeleccionaEmpresa( self, edt_planta_destino_occ, sAux ) then
    edt_planta_destino_occ.Text:= sAux;
end;

procedure TFOrdenCarga.BGBCentro_occClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= centro_salida_occ.Text;
  if SeleccionaCentro( self, centro_salida_occ, empresa_occ.text, sAux ) then
    centro_salida_occ.Text:= sAux;
end;


procedure TFOrdenCarga.btn_centro_destino_occClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= edt_centro_destino_occ.Text;
  if SeleccionaCentro( self, edt_centro_destino_occ, edt_planta_destino_occ.text, sAux ) then
    edt_centro_destino_occ.Text:= sAux;
end;

procedure TFOrdenCarga.BCBFecha_occClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= fecha_occ.Text;
  if PonFecha( self, fecha_occ, fecha_occ.Text, sAux ) then
    fecha_occ.Text:= sAux;
end;

procedure TFOrdenCarga.btnBGBCliente_sal_occClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= cliente_sal_occ.Text;
  if UFClientes.SeleccionaClientes( self, cliente_sal_occ, empresa_occ.text, sAux ) then
    cliente_sal_occ.Text:= sAux;
end;

procedure TFOrdenCarga.btnBGBDir_sum_occClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= dir_sum_occ.Text;
  if UFSuministros.SeleccionaSuministros( self, dir_sum_occ, empresa_occ.text, cliente_sal_occ.text, sAux ) then
    dir_sum_occ.Text:= sAux;
end;

procedure TFOrdenCarga.btnBGBMoneda_occClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= moneda_occ.Text;
  if SeleccionaMoneda( self, moneda_occ, sAux ) then
    moneda_occ.Text:= sAux;
end;

procedure TFOrdenCarga.BGBtransporte_occClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= transporte_occ.Text;
  if SeleccionaTransportista( self, transporte_occ, empresa_occ.text, sAux ) then
    transporte_occ.Text:= sAux;
end;

procedure TFOrdenCarga.BGBoperador_transporte_occClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= operador_transporte_occ.Text;
  if SeleccionaTransportista( self, operador_transporte_occ, empresa_occ.text, sAux ) then
    operador_transporte_occ.Text:= sAux;
end;

procedure TFOrdenCarga.BGBProducto_oclClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= Producto_ocl.Text;
  if SeleccionaProducto( self, Producto_ocl, empresa_occ.text, sAux ) then
    Producto_ocl.Text:= sAux;
end;

procedure TFOrdenCarga.BGBEnvase_oclClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= Envase_ocl.Text;
  if SeleccionaEnvaseCliente( self,envase_ocl, empresa_occ.Text, producto_ocl.Text, cliente_sal_occ.Text, sAux ) then
    Envase_ocl.Text:= sAux;
end;

procedure TFOrdenCarga.BGBMarca_oclClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= Marca_ocl.Text;
  if SeleccionaMarca( self, Marca_ocl, sAux ) then
    Marca_ocl.Text:= sAux;
end;

procedure TFOrdenCarga.BGBCalibre_oclClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= Calibre_ocl.Text;
  if SeleccionaCalibre( self, Calibre_ocl, empresa_occ.text, producto_ocl.text, sAux ) then
    Calibre_ocl.Text:= sAux;
end;

procedure TFOrdenCarga.BGBCategoria_oclClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= Categoria_ocl.Text;
  if SeleccionaCategoria( self, Categoria_ocl, empresa_occ.text, producto_ocl.text, sAux ) then
    Categoria_ocl.Text:= sAux;
end;

procedure TFOrdenCarga.BGBTipo_Palet_oclClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= tipo_palets_ocl.Text;
  if SeleccionaPalet( self, tipo_palets_ocl, sAux ) then
    tipo_palets_ocl.Text:= sAux;
end;

procedure TFOrdenCarga.BGBColor_oclClick(Sender: TObject);
var
  sAux: String;
begin
  sAux:= Color_ocl.Text;
  if SeleccionaColor( self, Color_ocl, empresa_occ.text, producto_ocl.text, sAux ) then
    Color_ocl.Text:= sAux;
end;

procedure TFOrdenCarga.QOrdenCargaCAfterEdit(DataSet: TDataSet);
begin
  //Guardar datos cabecera
  sEmpresaActual:= empresa_occ.Text;
  sCentroActual:= centro_salida_occ.Text;
  sFechaActual:= fecha_occ.Text;
  sClienteActual:= cliente_sal_occ.Text;
  rImpuestosActual:= DOrdenCarga.ImpuestosCliente( sEmpresaActual, sCentroActual, sClienteActual, dir_sum_occ.Text, StrToDateTime( fecha_occ.Text ) );
end;

procedure TFOrdenCarga.QOrdenCargaCBeforePost(DataSet: TDataSet);
var
  dAuxDate: TDateTime;
begin
  //Comprobar que la fecha se correcta
  if not TryStrTodate( fecha_occ.Text, dAuxDate ) then
  begin
    ShowMessage('Fecha incorrecta.');
    if fecha_occ.CanFocus then
      fecha_occ.SetFocus;
    Abort;
  end;
  //Comprobar que la direccion de suministro sea correcta
  if Trim( edt_centro_destino_occ.Text ) = '' then
  begin
    if Trim( cliente_sal_occ.Text ) = '' then
    begin
      ShowMessage('Tanto el c�digo del cliente, la direccion de suministro y a quien facturamos son de obligada inserci�n.');
      if cliente_sal_occ.CanFocus then
        cliente_sal_occ.SetFocus;
      Abort;
    end;
    if Trim( dir_sum_occ.Text ) = '' then
    begin
      ShowMessage('Tanto el c�digo del cliente, la direccion de suministro y a quien facturamos son de obligada inserci�n.');
      if dir_sum_occ.CanFocus then
        dir_sum_occ.SetFocus;
      Abort;
    end;
    if not DOrdenCarga.EsDirSuministroValida( empresa_occ.Text, cliente_sal_occ.Text, dir_sum_occ.Text ) then
    begin
      ShowMessage('Direccion de suministro incorrecta.');
      if dir_sum_occ.CanFocus then
        dir_sum_occ.SetFocus;
      Abort;
    end;
    if ( QOrdenCargaC.Active ) and ( QOrdenCargaC.state in [ dsInsert, dsEdit ] ) then
    begin
      QOrdenCargaCcentro_destino_occ.Clear;
    end;

    edt_centro_destino_occ.Text:= '';
    edt_planta_destino_occ.Text:= '';
  end
  else
  begin
    if ( QOrdenCargaC.Active ) and ( QOrdenCargaC.state in [ dsInsert, dsEdit ] ) then
    begin
      QOrdenCargaCcliente_sal_occ.Clear;
      QOrdenCargaCdir_sum_occ.Clear;
      QOrdenCargaCcliente_fac_occ.Clear;
    end;

    cliente_sal_occ.Text:= '';
    dir_sum_occ.Text:= '';
    moneda_occ.Text:= '';
    n_pedido_occ.Text:= '';
  end;
  //La moneda obligatoria
  if Trim( moneda_occ.Text ) = '' then
  begin
    ShowMessage('Falta moneda.');
    if moneda_occ.CanFocus then
      moneda_occ.SetFocus;
    Abort;
  end;
  //El transporte es obligatorio
  if Trim( transporte_occ.Text ) = '' then
  begin
    ShowMessage('Falta transporte.');
    if transporte_occ.CanFocus then
      transporte_occ.SetFocus;
    Abort;
  end;
  if Trim( operador_transporte_occ.Text ) = '' then
  begin
    operador_transporte_occ.Text:= transporte_occ.Text;
    QOrdenCargaCoperador_transporte_occ.AsString:= transporte_occ.Text;
  end;
end;

procedure TFOrdenCarga.QOrdenCargaCAfterPost(DataSet: TDataSet);
var
  rImpuestosAux: TImpuesto;
begin
  //Ver si hay que hacer cambios en los detalles
  if EstadoActual = kEditarCabecera then
  begin
    if sEmpresaActual <> empresa_occ.Text then
    begin
      DOrdenCarga.CambiarEmpresaDetalle( StrToInt( orden_occ.Text ), empresa_occ.Text );
    end;
    if sCentroActual <> centro_salida_occ.Text then
    begin
      DOrdenCarga.CambiarCentroDetalle( StrToInt( orden_occ.Text ), centro_salida_occ.Text );
    end;
    if sFechaActual <> fecha_occ.Text then
    begin
      DOrdenCarga.CambiarFechaDetalle( StrToInt( orden_occ.Text ), StrToDate( fecha_occ.Text ) );
    end;
    if sClienteActual <> cliente_sal_occ.Text then
    begin
      DOrdenCarga.CambiarClienteDetalle( StrToInt( orden_occ.Text ), cliente_sal_occ.Text );
    end;
    rImpuestosAux:= DOrdenCarga.ImpuestosCliente( empresa_occ.Text, centro_salida_occ.Text,
                                                  cliente_sal_occ.Text, dir_sum_occ.Text, StrToDateTime( fecha_occ.Text ) );
    if ( rImpuestosActual.sCodigo <> rImpuestosAux.sCodigo ) or
       ( rImpuestosActual.sTipo <> rImpuestosAux.sTipo )  then
    begin
      DOrdenCarga.CambiarImpuestoDetalle( StrToInt( orden_occ.Text ), rImpuestosAux );
    end;
  end;
end;

procedure TFOrdenCarga.QOrdenCargaLBeforePost(DataSet: TDataSet);
begin
  if Trim( producto_ocl.Text ) = '' then
  begin
    ShowMessage('El producto es de obligada inserci�n.');
    if producto_ocl.CanFocus then
      producto_ocl.SetFocus;
    Abort;
  end;

  if Trim( envase_ocl.Text ) = '' then
  begin
    ShowMessage('El envase es de obligada inserci�n.');
    if envase_ocl.CanFocus then
      envase_ocl.SetFocus;
    Abort;
  end;

  if Trim( marca_ocl.Text ) = '' then
  begin
    ShowMessage('La marca es de obligada inserci�n.');
    if marca_ocl.CanFocus then
      marca_ocl.SetFocus;
    Abort;
  end;

  if Trim( calibre_ocl.Text ) = '' then
  begin
    ShowMessage('El calibre es de obligada inserci�n.');
    if calibre_ocl.CanFocus then
      calibre_ocl.SetFocus;
    Abort;
  end;

  if Trim( categoria_ocl.Text ) = '' then
  begin
    ShowMessage('La categoria es de obligada inserci�n.');
    if categoria_ocl.CanFocus then
      categoria_ocl.SetFocus;
    Abort;
  end;

  if Trim( color_ocl.Text ) = '' then
  begin
    ShowMessage('El color es de obligada inserci�n.');
    if color_ocl.CanFocus then
      color_ocl.SetFocus;
    Abort;
  end;

  if Trim( cajas_ocl.Text ) = '' then
  begin
    ShowMessage('Las cajas son de obligada inserci�n.');
    if cajas_ocl.CanFocus then
      cajas_ocl.SetFocus;
    Abort;
  end;


  if Trim( kilos_ocl.Text ) = '' then
  begin
    ShowMessage('Los kilos son de obligada inserci�n.');
    if kilos_ocl.CanFocus then
      kilos_ocl.SetFocus;
    Abort;
  end;

  if ( Trim( n_palets_ocl.Text ) = '' ) then
  begin
    ShowMessage('Los palets son de obligada inserci�n.');
    if n_palets_ocl.CanFocus then
      n_palets_ocl.SetFocus;
    Abort;
  end;
  (*
  else
  begin
    if ( StrToInt( n_palets_ocl.Text ) < 1 ) then
    begin
      ShowMessage('Tiene que haber por lo menos un palet.');
      if n_palets_ocl.CanFocus then
        n_palets_ocl.SetFocus;
      Abort;
    end;
  end;
  *)

  if ( Trim( tipo_palets_ocl.Text ) = '' ) then
  begin
    ShowMessage('El tipo de palet es de obligada inserci�n.');
    if tipo_palets_ocl.CanFocus then
      tipo_palets_ocl.SetFocus;
    Abort;
  end;

  QOrdenCargaLemp_procede_ocl.AsString:= DOrdenCarga.EmpProcedencia(QOrdenCargaCempresa_occ.AsString,
    QOrdenCargaCcliente_sal_occ.AsString, QOrdenCargaLproducto_ocl.AsString, QOrdenCargaCcentro_salida_occ.AsString);

  //Integridad con el packing list
  if QOrdenCargaL.State = dsEdit then
  if not DOrdenCarga.ComprobarIntegridadLinea( QOrdenCargaLorden_ocl.AsInteger, QOrdenCargaLlinea_ocl.AsInteger,
    QOrdenCargaLempresa_ocl.AsString, QOrdenCargaLproducto_ocl.AsString, QOrdenCargaLenvase_ocl.AsString,
    QOrdenCargaLcajas_ocl.AsInteger, QOrdenCargaLn_palets_ocl.AsInteger ) then
  begin
    if Application.MessageBox('Integridad con el Packing List rota, hay mas cajas y/o palets en el cami�n que en la orden de carga.' + #13 + #10 +
                              '�Esta seguro de querer continuar con la grabaci�n?      ', 'AVISO PACKING LIST', mb_yesno) = idno then
      Abort;
  end;

  //Envase correcto
  if not DOrdenCarga.IsEnvaseCorrecto( empresa_occ.Text, producto_ocl.Text, envase_ocl.Text ) then
  begin
    ShowMessage('El envase no es correcto para el producto seleccionado.      ');
      if producto_ocl.CanFocus then
        producto_ocl.SetFocus;
    Abort;
  end;
end;

procedure TFOrdenCarga.QOrdenCargaLAfterPost(DataSet: TDataSet);
begin
  //Actualizar numero de palets
  DOrdenCarga.UpdatePaletsCab( DataSet.FieldByName('orden_ocl').AsInteger );
  RefrescarOrden( DataSet.FieldByName('orden_ocl').AsString );
end;

procedure TFOrdenCarga.QOrdenCargaLAfterInsert(DataSet: TDataSet);
begin
  QOrdenCargaLorden_ocl.AsInteger:= QOrdenCargaCorden_occ.AsInteger;
  QOrdenCargaLlinea_ocl.AsInteger:= DOrdenCarga.GetLineaOrden( QOrdenCargaCorden_occ.AsInteger ) + 1;

  QOrdenCargaLempresa_ocl.AsString:= QOrdenCargaCempresa_occ.AsString;
  QOrdenCargaLcentro_salida_ocl.AsString:= QOrdenCargaCcentro_salida_occ.AsString;
  QOrdenCargaLn_albaran_ocl.AsInteger:= QOrdenCargaCn_albaran_occ.AsInteger;
  QOrdenCargaLfecha_ocl.AsDateTime:= QOrdenCargaCfecha_occ.AsDateTime;

  QOrdenCargaLcliente_ocl.AsString:= QOrdenCargaCcliente_sal_occ.AsString;

  rImpuestosActual:= DOrdenCarga.ImpuestosCliente( empresa_occ.Text, centro_salida_occ.Text,
                                                  cliente_sal_occ.Text, dir_sum_occ.Text, StrToDateTime( fecha_occ.Text ) );
  Lporc_iva_ocl.Caption:= '% ' + rImpuestosActual.sTipo;

  QOrdenCargaLporc_iva_ocl.AsFloat:= 0;
  QOrdenCargaLtipo_iva_ocl.AsString:= rImpuestosActual.sCodigo;

  QOrdenCargaLcajas_ocl.AsInteger:= 0;
  QOrdenCargaLkilos_ocl.AsInteger:= 0;
  QOrdenCargaLiva_ocl.AsInteger:= 0;
  QOrdenCargaLimporte_neto_ocl.AsInteger:= 0;
  QOrdenCargaLimporte_total_ocl.AsInteger:= 0;
  STUnidades.Caption:= '0';
  QOrdenCargaLn_palets_ocl.AsInteger:= 1;

  QOrdenCargaLcentro_origen_ocl.AsString:= QOrdenCargaCcentro_salida_occ.AsString;
end;

procedure TFOrdenCarga.QOrdenCargaLAfterEdit(DataSet: TDataSet);
begin
  rImpuestosActual:= DOrdenCarga.ImpuestosCliente( empresa_occ.Text, centro_salida_occ.Text,
                                                  cliente_sal_occ.Text, dir_sum_occ.Text, StrToDateTime( fecha_occ.Text ) );
  ActualizarValores;
end;

procedure TFOrdenCarga.ActualizarValores;
begin

  if QOrdenCargaL.State in [dsINsert, dsEdit] then
  begin
    iCajas:= StrToIntDef( cajas_ocl.Text, 0 );
    rKilos:= StrToFloatDef( kilos_ocl.Text, 0 );
    iUnidades:= iCajas * iUnidadesCaja;
  end;

  rPrecio:= StrToFloatDef( precio_ocl.Text, 0 );
  if sFacturar = 'U' then
  begin
    rImporte:= SimpleRoundTo( rPrecio * iUnidades, -2);
  end
  else
  if sFacturar = 'C' then
  begin
    rImporte:= SimpleRoundTo( rPrecio * iCajas, -2);
  end
  else
  begin
     rImporte:= SimpleRoundTo( rPrecio * rKilos, -2);
  end;

  rIva:=  StrToIntDef( porc_iva_ocl.Text, 0 );
  rIva:= SimpleRoundTo( ( rImporte * rIva ) / 100, -2);
  rTotal:= rImporte + rIva;

  STUnidades.Caption:= IntToStr( iUnidades );
end;

procedure TFOrdenCarga.ActualizarValoresCantidad;
begin
  if QOrdenCargaL.State in [dsINsert, dsEdit] then
  begin
    iCajas:= StrToIntDef( cajas_ocl.Text, 0 );
    if rPesoCaja > 0 then
    begin
      rKilos:= SimpleRoundTo( iCajas * rPesoCaja, -2);
      kilos_ocl.Text:= FloatToStr( rKilos );
    end
    else
    begin
      rKilos:= StrToFloatDef( kilos_ocl.Text, 0 );
    end;
    iUnidades:= iCajas * iUnidadesCaja;
  end;

  rPrecio:= StrToFloatDef( precio_ocl.Text, 0 );
  if sFacturar = 'U' then
  begin
    rImporte:= SimpleRoundTo( rPrecio * iUnidades, -2);
  end
  else
  if sFacturar = 'C' then
  begin
    rImporte:= SimpleRoundTo( rPrecio * iCajas, -2);
  end
  else
  begin
     rImporte:= SimpleRoundTo( rPrecio * rKilos, -2);
  end;

  rIva:= StrToIntDef( porc_iva_ocl.Text, 0 );
  rIva:= SimpleRoundTo( ( rImporte * rIva ) / 100, -2);
  rTotal:= rImporte + rIva;

  if bPesoVariable then
  begin
    kilos_ocl.Enabled:= true;
  end
  else
  begin
    kilos_ocl.Enabled:= False;
  end;
  STUnidades.Caption:= IntToStr( iUnidades );
end;

procedure TFOrdenCarga.ActualizarValoresPrecio;
begin
  if QOrdenCargaL.State in [dsINsert, dsEdit] then
  begin
    iCajas:= StrToIntDef( cajas_ocl.Text, 0 );
    rKilos:= StrToFloatDef( kilos_ocl.Text, 0 );
    iUnidades:= iCajas * iUnidadesCaja;
  end;

  rPrecio:= StrToFloatDef( precio_ocl.Text, 0 );
  if sFacturar = 'U' then
  begin
    rImporte:= SimpleRoundTo( rPrecio * iUnidades, -2);
  end
  else
  if sFacturar = 'C' then
  begin
    rImporte:= SimpleRoundTo( rPrecio * iCajas, -2);
  end
  else
  begin
     rImporte:= SimpleRoundTo( rPrecio * rKilos, -2);
  end;


  rIva:=  StrToIntDef( porc_iva_ocl.Text, 0 );
  rIva:= SimpleRoundTo( ( rImporte * rIva ) / 100, -2);
  rTotal:= rImporte + rIva;

  if bPesoVariable then
  begin
    kilos_ocl.Enabled:= true;
  end
  else
  begin
    kilos_ocl.Enabled:= False;
  end;
  STUnidades.Caption:= IntToStr( iUnidades );
end;

procedure TFOrdenCarga.ActualizarValoresImporte;
begin
  if QOrdenCargaL.State in [dsINsert, dsEdit] then
  begin
    iCajas:= StrToIntDef( cajas_ocl.Text, 0 );
    rKilos:= StrToFloatDef( kilos_ocl.Text, 0 );
    iUnidades:= iCajas * iUnidadesCaja;
  end;

   rImporte:= StrToFloatDef( importe_neto_ocl.Text, 0 );
   if sFacturar = 'U' then
   begin
     if iUnidades <> 0 then
       rPrecio:= SimpleRoundTo( rImporte / iUnidades, -3)
     else
       rPrecio:= 0;
   end
   else
   if sFacturar = 'C' then
   begin
     if iCajas <> 0 then
       rPrecio:= SimpleRoundTo( rImporte / iCajas, -3)
     else
       rPrecio:= 0;
   end
   else
   begin
     if rKilos <> 0 then
       rPrecio:= SimpleRoundTo( rImporte / rKilos, -3)
     else
       rPrecio:= 0;
   end;


   rIva:=  StrToIntDef( porc_iva_ocl.Text, 0 );
   rIva:= SimpleRoundTo( ( rImporte * rIva ) / 100, -2);
   rTotal:= rImporte + rIva;

   if bPesoVariable then
   begin
     kilos_ocl.Enabled:= true;
   end
   else
   begin
     kilos_ocl.Enabled:= False;
   end;
   STUnidades.Caption:= IntToStr( iUnidades );
end;

procedure TFOrdenCarga.cajas_oclChange(Sender: TObject);
begin
  ActualizarValoresCantidad;
  if QOrdenCargaL.State in [dsInsert, dsEdit] then
  begin
    QOrdenCargaLcajas_ocl.AsInteger:= ICajas;
    //if not bPesoVariable then
    QOrdenCargaLkilos_ocl.AsFloat:= rKilos;
    QOrdenCargaLimporte_neto_ocl.AsFloat:= rImporte;
    QOrdenCargaLiva_ocl.AsFloat:= rIva;
    QOrdenCargaLimporte_total_ocl.AsFloat:= rTotal;
  end;
end;

procedure TFOrdenCarga.kilos_oclChange(Sender: TObject);
begin
  ActualizarValores;
  if QOrdenCargaL.State in [dsInsert, dsEdit] then
  begin
    QOrdenCargaLcajas_ocl.AsInteger:= ICajas;
    //if not bPesoVariable then
    QOrdenCargaLkilos_ocl.AsFloat:= rKilos;
    QOrdenCargaLimporte_neto_ocl.AsFloat:= rImporte;
    QOrdenCargaLiva_ocl.AsFloat:= rIva;
    QOrdenCargaLimporte_total_ocl.AsFloat:= rTotal;
  end;
end;

procedure TFOrdenCarga.precio_oclChange(Sender: TObject);
begin
  if precio_ocl.Focused then
  begin
    ActualizarValoresPrecio;
    if QOrdenCargaL.State in [dsInsert, dsEdit] then
    begin
      QOrdenCargaLcajas_ocl.AsInteger:= ICajas;
      //if not  bPesoVariable then
      QOrdenCargaLkilos_ocl.AsFloat:= rKilos;
      QOrdenCargaLimporte_neto_ocl.AsFloat:= rImporte;
      QOrdenCargaLiva_ocl.AsFloat:= rIva;
      QOrdenCargaLimporte_total_ocl.AsFloat:= rTotal;
    end;
  end;
end;

procedure TFOrdenCarga.importe_neto_oclChange(Sender: TObject);
begin
  if importe_neto_ocl.Focused then
  begin
    ActualizarValoresImporte;
    if QOrdenCargaL.State in [dsInsert, dsEdit] then
    begin
      QOrdenCargaLcajas_ocl.AsInteger:= ICajas;
      //if not  bPesoVariable then
      QOrdenCargaLkilos_ocl.AsFloat:= rKilos;
      QOrdenCargaLprecio_ocl.AsFloat:= rPrecio;
      QOrdenCargaLiva_ocl.AsFloat:= rIva;
      QOrdenCargaLimporte_total_ocl.AsFloat:= rTotal;
    end;
  end;
end;

procedure TFOrdenCarga.ConstruirFiltro;
var
  sAux: string;
begin
  sAux:= '';
  if mnuCreadas.Checked then
  begin
    sAux:= ' ( status_occ = 0 ) ';
  end;
  if mnuActivas.Checked then
  begin
    if sAux <> '' then
      sAux:= sAux + ' or ';
    sAux:= sAux + ' ( status_occ = 1 ) ';
  end;
  if mnuInicializadas.Checked then
  begin
    if sAux <> '' then
      sAux:= sAux + ' or ';
    sAux:= sAux + ' ( status_occ = 2 ) ';
  end;
  if mnuFinalizadas.Checked then
  begin
    if sAux <> '' then
      sAux:= sAux + ' or ';
    sAux:= sAux + ' ( status_occ = 3 ) ';
  end;
  if sAux <> '' then
  begin
    QOrdenCargaC.Filtered:= True;
    QOrdenCargaC.Filter:= sAux;
  end
  else
  begin
    QOrdenCargaC.Filtered:= False;
  end;
  HabilitarBarra;
end;

procedure TFOrdenCarga.btnResumenClick(Sender: TObject);
begin
  try
    if QOrdenCargaC.Active then
    begin
      if not QOrdenCargaC.IsEmpty then
      begin
        RefrescarOrden( QOrdenCargaCorden_occ.AsString );
      end;
    end;
    QOrdenCargaL.Close;
    UFResumen.VerResumenOrdenes( Self );
  finally
    QOrdenCargaL.Open;
  end;

  if QOrdenCargaC.Active then
  begin
    if not QOrdenCargaC.IsEmpty then
    begin
      RefrescarOrden( QOrdenCargaCorden_occ.AsString );
    end;
  end;
end;

procedure TFOrdenCarga.porte_bonny_occEnter(Sender: TObject);
begin
  TDBCheckBox(Sender).Color:= clMoneyGreen;
end;

procedure TFOrdenCarga.porte_bonny_occExit(Sender: TObject);
begin
  TDBCheckBox(Sender).Color:= clBtnFace;
end;

procedure TFOrdenCarga.mnuEnviarCorreoClick(Sender: TObject);
var
  sFileName: string;
begin
  sFileName:= DOrdenCarga.sDirTemp + 'Orden' + orden_occ.Text + '.pdf';

  GuardarOrden( self, StrToInt( orden_occ.Text ), sFileName );
  if FileExists( sFileName ) then
  begin
    AFQuickMail.TextToSend.Clear;
    AFQuickMail.TextToSend.Add('Env�o como adjunto la orden n� ' + orden_occ.Text + '.');
    AFQuickMail.Subject:= 'Orden de carga N� ' + orden_occ.Text;
    AFQuickMail.FileNames.Clear;
    AFQuickMail.FileNames.Add( sFileName );
    try
      AFQuickMail.Execute;
    finally
      if FileExists( sFileName ) then
       DeleteFile( sFileName );
    end;
  end
  else
  begin
    ShowMessage('Problemas al generar el ficheo PDF.');
  end;
end;

procedure TFOrdenCarga.status_occChange(Sender: TObject);
begin
  case QOrdenCargaCstatus_occ.AsInteger of
    0:
    begin
      Shape1.Pen.Color:= clBlack;
      des_status_occ.Font.Color:= clBlack;
    end;
    1:
    begin
       Shape1.Pen.Color:= clGreen;
       des_status_occ.Font.Color:= clGreen;
    end;
    2:
    begin
      Shape1.Pen.Color:= clBlue;
      des_status_occ.Font.Color:= clBlue;
    end;
    3:
    begin
      Shape1.Pen.Color:= clRed;
      des_status_occ.Font.Color:= clRed;
    end;
    else
    begin
      Shape1.Pen.Color:= clWhite;
      des_status_occ.Font.Color:= clWhite;
    end;
  end;
end;

procedure TFOrdenCarga.UnirTransito;
begin
  UFAsignarTransito.Execute( Self, orden_occ.Text, empresa_occ.Text, STEmpresa_occ.Caption,
                            centro_salida_occ.Text, STCentro_salida_occ.Caption,
                            edt_centro_destino_occ.Text, ST_centro_destino_occ.Caption, fecha_occ.Text );
end;

procedure TFOrdenCarga.UnirAlbaran;
begin
  UFAsignarAlbaran.Execute( Self, orden_occ.Text, empresa_occ.Text, STEmpresa_occ.Caption,
                            centro_salida_occ.Text, STCentro_salida_occ.Caption,
                            cliente_sal_occ.Text, STCliente_sal_occ.Caption,
                            dir_sum_occ.Text, STDir_sum_occ.Caption, fecha_occ.Text );
end;

procedure TFOrdenCarga.QOrdenCargaCAfterOpen(DataSet: TDataSet);
begin
  if DataSet.FieldByName('centro_destino_occ').AsString = '' then
  begin
    pgcDestino.ActivePage:= tsSalida;
  end
  else
  begin
    pgcDestino.ActivePage:= tsTransito;
  end;
end;

procedure TFOrdenCarga.QOrdenCargaCAfterScroll(DataSet: TDataSet);
begin
  if DataSet.FieldByName('centro_destino_occ').AsString = '' then
  begin
    pgcDestino.ActivePage:= tsSalida;
  end
  else
  begin
    pgcDestino.ActivePage:= tsTransito;
  end;
end;

procedure TFOrdenCarga.dir_sum_occExit(Sender: TObject);
begin
  if QOrdenCargaC.State in [dsInsert, dsEdit] then
  begin
    if STDir_sum_occ.Caption <> '' then
    if ( nota_occ.Text = '' )  then
    begin
      if ( empresa_occ.Text = 'F18' ) then
      begin
        nota_occ.Lines.Add('TEMPERATURA ENTRE 1� y 4� C');
        nota_occ.Lines.Add('TEMPERATURA SALIDA PRODUCTO');
      end
      else
      begin
        if ( empresa_occ.Text = 'F21' ) then
        begin
          nota_occ.Lines.Add('TEMPERATURA OPTIMA DE +8 A +12 GRADOS.');
          nota_occ.Lines.Add('FURGON PRE-ENFRIADO : SI');
        end
        else
        begin
          //if cliente_sal_occ.Text = 'MER' then
          begin
            nota_occ.Lines.Add('TEMPERATURA �PTIMA 12 GRADOS.');
            nota_occ.Lines.Add('EQUIPO FR�O EN FUNCIONAMIENTO: SI.');
          end;
        end;
      end;
      if ( empresa_occ.Text = '050' ) and ( cliente_sal_occ.Text = 'MER' ) and ( dir_sum_occ.Text = '2MN' ) then
      begin
        nota_occ.Lines.Add(UpperCase('La mercanc�a transportada realiza tr�fico mar�timo entre islas'));
      end;
    end;
  end;
end;

End.

