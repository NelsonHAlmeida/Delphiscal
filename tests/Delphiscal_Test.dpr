program Delphiscal_Test;

{$IFNDEF TESTINSIGHT}
{$APPTYPE CONSOLE}
{$ENDIF}
{$STRONGLINKTYPES ON}
uses
  System.SysUtils,
  {$IFDEF TESTINSIGHT}
  TestInsight.DUnitX,
  {$ELSE}
  DUnitX.Loggers.Console,
  DUnitX.Loggers.Xml.NUnit,
  {$ENDIF }
  DUnitX.TestFramework,
  Delphiscal.Icms.BaseProprio.Test in 'src\Delphiscal.Icms.BaseProprio.Test.pas',
  Delphiscal.Icms.BaseST.Test in 'src\Delphiscal.Icms.BaseST.Test.pas',
  Delphiscal.Icms00.Test in 'src\Delphiscal.Icms00.Test.pas',
  Delphiscal.Icms101.Test in 'src\Delphiscal.Icms101.Test.pas',
  Delphiscal.Icms10.Test in 'src\Delphiscal.Icms10.Test.pas',
  Delphiscal.Icms20.Test in 'src\Delphiscal.Icms20.Test.pas',
  Delphiscal.Icms201.Test in 'src\Delphiscal.Icms201.Test.pas',
  Delphiscal.Icms202_203.Test in 'src\Delphiscal.Icms202_203.Test.pas',
  Delphiscal.Pis01_02.Test in 'src\Delphiscal.Pis01_02.Test.pas',
  Delphiscal.Attributes.Intf in '..\src\Delphiscal.Attributes.Intf.pas',
  Delphiscal.Attributes in '..\src\Delphiscal.Attributes.pas',
  Delphiscal.Cofins.Base in '..\src\Delphiscal.Cofins.Base.pas',
  Delphiscal.Cofins01_02.Intf in '..\src\Delphiscal.Cofins01_02.Intf.pas',
  Delphiscal.Cofins01_02 in '..\src\Delphiscal.Cofins01_02.pas',
  Delphiscal.Cofins03.Intf in '..\src\Delphiscal.Cofins03.Intf.pas',
  Delphiscal.Cofins03 in '..\src\Delphiscal.Cofins03.pas',
  Delphiscal.Icms.BaseProprio in '..\src\Delphiscal.Icms.BaseProprio.pas',
  Delphiscal.Icms.BaseST in '..\src\Delphiscal.Icms.BaseST.pas',
  Delphiscal.Icms.Valor in '..\src\Delphiscal.Icms.Valor.pas',
  Delphiscal.Icms.Valor.ST in '..\src\Delphiscal.Icms.Valor.ST.pas',
  Delphiscal.Icms00.Intf in '..\src\Delphiscal.Icms00.Intf.pas',
  Delphiscal.Icms00 in '..\src\Delphiscal.Icms00.pas',
  Delphiscal.Icms10.Intf in '..\src\Delphiscal.Icms10.Intf.pas',
  Delphiscal.Icms10 in '..\src\Delphiscal.Icms10.pas',
  Delphiscal.Icms20.Intf in '..\src\Delphiscal.Icms20.Intf.pas',
  Delphiscal.Icms20 in '..\src\Delphiscal.Icms20.pas',
  Delphiscal.Icms30.Intf in '..\src\Delphiscal.Icms30.Intf.pas',
  Delphiscal.Icms30 in '..\src\Delphiscal.Icms30.pas',
  Delphiscal.Icms51.Intf in '..\src\Delphiscal.Icms51.Intf.pas',
  Delphiscal.Icms51 in '..\src\Delphiscal.Icms51.pas',
  Delphiscal.Icms70.Intf in '..\src\Delphiscal.Icms70.Intf.pas',
  Delphiscal.Icms70 in '..\src\Delphiscal.Icms70.pas',
  Delphiscal.Icms101.Intf in '..\src\Delphiscal.Icms101.Intf.pas',
  Delphiscal.Icms101 in '..\src\Delphiscal.Icms101.pas',
  Delphiscal.Icms201.Intf in '..\src\Delphiscal.Icms201.Intf.pas',
  Delphiscal.Icms201 in '..\src\Delphiscal.Icms201.pas',
  Delphiscal.Icms202_203.Intf in '..\src\Delphiscal.Icms202_203.Intf.pas',
  Delphiscal.Icms202_203 in '..\src\Delphiscal.Icms202_203.pas',
  Delphiscal.Ipi.Base in '..\src\Delphiscal.Ipi.Base.pas',
  Delphiscal.Ipi50AdValorem.Intf in '..\src\Delphiscal.Ipi50AdValorem.Intf.pas',
  Delphiscal.Ipi50AdValorem in '..\src\Delphiscal.Ipi50AdValorem.pas',
  Delphiscal.Ipi50Especifico.Intf in '..\src\Delphiscal.Ipi50Especifico.Intf.pas',
  Delphiscal.Ipi50Especifico in '..\src\Delphiscal.Ipi50Especifico.pas',
  Delphiscal.Pis.Base.Intf in '..\src\Delphiscal.Pis.Base.Intf.pas',
  Delphiscal.Pis.Base in '..\src\Delphiscal.Pis.Base.pas',
  Delphiscal.Pis01_02.Intf in '..\src\Delphiscal.Pis01_02.Intf.pas',
  Delphiscal.Pis01_02 in '..\src\Delphiscal.Pis01_02.pas',
  Delphiscal.Pis03.Intf in '..\src\Delphiscal.Pis03.Intf.pas',
  Delphiscal.Pis03 in '..\src\Delphiscal.Pis03.pas',
  Delphiscal.Utils in '..\src\Delphiscal.Utils.pas';

{$IFNDEF TESTINSIGHT}
var
  runner: ITestRunner;
  results: IRunResults;
  logger: ITestLogger;
  nunitLogger : ITestLogger;
{$ENDIF}
begin
  IsConsole := False;
  ReportMemoryLeaksOnShutdown := True;

{$IFDEF TESTINSIGHT}
  TestInsight.DUnitX.RunRegisteredTests;
{$ELSE}
  try
    //Check command line options, will exit if invalid
    TDUnitX.CheckCommandLine;
    //Create the test runner
    runner := TDUnitX.CreateRunner;
    //Tell the runner to use RTTI to find Fixtures
    runner.UseRTTI := True;
    //When true, Assertions must be made during tests;
    runner.FailsOnNoAsserts := False;

    //tell the runner how we will log things
    //Log to the console window if desired
    if TDUnitX.Options.ConsoleMode <> TDunitXConsoleMode.Off then
    begin
      logger := TDUnitXConsoleLogger.Create(TDUnitX.Options.ConsoleMode = TDunitXConsoleMode.Quiet);
      runner.AddLogger(logger);
    end;
    //Generate an NUnit compatible XML File
    nunitLogger := TDUnitXXMLNUnitFileLogger.Create(TDUnitX.Options.XMLOutputFile);
    runner.AddLogger(nunitLogger);

    //Run tests
    results := runner.Execute;
    if not results.AllPassed then
      System.ExitCode := EXIT_ERRORS;

    {$IFNDEF CI}
    //We don't want this happening when running under CI.
    System.Write('Done.. press <Enter> key to quit.');
    System.Readln;
    {$ENDIF}
  except
    on E: Exception do
      System.Writeln(E.ClassName, ': ', E.Message);
  end;
{$ENDIF}
end.
