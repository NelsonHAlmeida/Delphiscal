unit Delphiscal.Icms00.Intf;

interface

uses
  Delphiscal.Attributes.Intf;

type
  IIcms00 = interface
    ['{1562944F-E256-4BBB-9A9D-6DF253CE5150}']
    function Attributes : IAttributes<IIcms00>;
    function BaseIcmsProprio: Double;
    function ValorIcmsProprio: Double;
  end;

implementation

end.
