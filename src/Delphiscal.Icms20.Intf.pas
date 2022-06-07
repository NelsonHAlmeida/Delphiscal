unit Delphiscal.Icms20.Intf;

interface

type
  IIcms20 = interface
    ['{B85C4D5F-A2B3-437E-BC40-1EF5ADFC4666}']
    function BaseReduzidaIcmsProprio: Currency;
    function ValorIcmsProprio: Currency;
    function ValorIcmsDesonerado: Currency;
  end;

implementation

end.
