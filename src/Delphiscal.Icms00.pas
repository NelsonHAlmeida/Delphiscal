unit Delphiscal.Icms00;

interface

uses
  Delphiscal.Icms.BaseProprio,
  Delphiscal.Icms.Valor,
  Delphiscal.Icms00.Intf,
  Delphiscal.Attributes.Intf;

type
  TIcms00 = class(TInterfacedObject, IIcms00)
  private
    FBaseIcmsProprio: TBaseIcmsProprio;
    FValorIcms: TValorIcms;
    FAttributes : IAttributes<IIcms00>;
    function BaseIcmsProprio: Double;
    function ValorIcmsProprio: Double;
    function Attributes : IAttributes<IIcms00>;
  public
    constructor Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AALiquotaICMS: Double;
      const AValorIpi: Double = 0); overload;
    constructor Create; overload;
    class function New(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AALiquotaICMS: Double;
      const AValorIpi: Double = 0): IIcms00; overload;
    class function New : IIcms00; overload;
    destructor Destroy; override;
  end;

implementation

uses
  Delphiscal.Utils,
  Delphiscal.Attributes;

function TIcms00.Attributes: IAttributes<IIcms00>;
begin
  if not Assigned(FAttributes) then
    FAttributes := TAttributes<IIcms00>.New(Self);
  Result := FAttributes;
end;

function TIcms00.BaseIcmsProprio: Double;
begin
  Result := RoundABNT(FBaseIcmsProprio.CalcularBaseIcmsProprio, 2);
end;

constructor TIcms00.Create;
begin
  //
end;

constructor TIcms00.Create(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto,
  AALiquotaICMS: Double; const AValorIpi: Double = 0);
begin
  FBaseIcmsProprio := TBaseIcmsProprio.Create(AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, 0,
    AValorIpi);
  FValorIcms := TValorIcms.Create(FBaseIcmsProprio, AALiquotaICMS);
end;

destructor TIcms00.Destroy;
begin
  FValorIcms.Free;
  FBaseIcmsProprio.Free;
  inherited;
end;

class function TIcms00.New: IIcms00;
begin
  Result := TIcms00.Create;
end;

class function TIcms00.New(const AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AALiquotaICMS,
  AValorIpi: Double): IIcms00;
begin
  Result := TIcms00.Create(AValorProduto, AValorFrete, AValorSeguro, ADespesasAcessorias, AValorDesconto, AALiquotaICMS,
    AValorIpi);
end;

function TIcms00.ValorIcmsProprio: Double;
begin
  Result := RoundABNT(FValorIcms.GetValorIcms, 2);
end;

end.
