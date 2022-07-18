unit Delphiscal.Attributes;

interface

uses
  Delphiscal.Attributes.Intf;

type
  TAttributes<T : IInterface>  = class(TInterfacedObject, IAttributes<T>)
  private
    [weak]
    FParent : T;
    FValorProduto: Double;
    FValorfrete: Double;
    FValorSeguro: Double;
    FValorDespesas: Double;
    FValorDesconto: Double;
    FValorIpi : Double;
    FAliquota : Double;
  public
    constructor Create(AParent : T);
    destructor Destroy; override;
    class function New(AParent : T): IAttributes<T>;
    function ValorProduto(const AValorProduto : Double)  : IAttributes<T>; overload;
    function ValorProduto : Double; overload;
    function ValorFrete(const AValorFrete : Double)  : IAttributes<T>; overload;
    function ValorFrete : Double; overload;
    function ValorSeguro(const AValorSeguro : Double)  : IAttributes<T>; overload;
    function ValorSeguro : Double; overload;
    function ValorDespesas(const AValorDespesas : Double) : IAttributes<T>; overload;
    function ValorDespesas : Double; overload;
    function ValorDesconto(const AValorDesconto : Double)  : IAttributes<T>; overload;
    function ValorDesconto : Double; overload;
    function ValorIpi(const AValorIpi : Double)  : IAttributes<T>; overload;
    function ValorIpi : Double; overload;
    function Aliquota(const AAliquota : Double)  : IAttributes<T>; overload;
    function Aliquota : Double; overload;
    function &End : T;
  end;

implementation

{ TModel }

function TAttributes<T>.&End: T;
begin
  Result := FParent;
end;

function TAttributes<T>.Aliquota: Double;
begin
  Result := FAliquota;
end;

function TAttributes<T>.Aliquota(const AAliquota: Double): IAttributes<T>;
begin
  Result := Self;
  FAliquota := AAliquota;
end;

constructor TAttributes<T>.Create(AParent : T);
begin
  FParent := AParent;
end;

function TAttributes<T>.ValorDespesas(
  const AValorDespesas : Double): IAttributes<T>;
begin
  Result := Self;
  FValorDespesas := AValorDespesas;
end;

function TAttributes<T>.ValorDespesas: Double;
begin
  Result := FValorDespesas;
end;

destructor TAttributes<T>.Destroy;
begin

  inherited;
end;

class function TAttributes<T>.New(AParent : T): IAttributes<T>;
begin
  Result:= Self.Create(AParent);
end;

function TAttributes<T>.ValorDesconto: Double;
begin
  Result := FValorDesconto;
end;

function TAttributes<T>.ValorDesconto(
  const AValorDesconto: Double): IAttributes<T>;
begin
  Result := Self;
  FValorDesconto := AValorDesconto;
end;

function TAttributes<T>.ValorFrete(const AValorFrete: Double): IAttributes<T>;
begin
  Result := Self;
  FValorfrete := AValorFrete;
end;

function TAttributes<T>.ValorFrete: Double;
begin
  Result := FValorfrete;
end;

function TAttributes<T>.ValorIpi: Double;
begin
  Result := FValorIpi;
end;

function TAttributes<T>.ValorIpi(const AValorIpi: Double): IAttributes<T>;
begin
  Result := Self;
  FValorIpi := AValorIpi;
end;

function TAttributes<T>.ValorProduto(
  const AValorProduto: Double): IAttributes<T>;
begin
  Result := Self;
  FValorProduto := AValorProduto;
end;

function TAttributes<T>.ValorProduto: Double;
begin
  Result := FValorProduto;
end;

function TAttributes<T>.ValorSeguro(const AValorSeguro: Double): IAttributes<T>;
begin
  Result := Self;
  FValorSeguro := AValorSeguro;
end;

function TAttributes<T>.ValorSeguro: Double;
begin
  Result := FValorSeguro;
end;

end.

