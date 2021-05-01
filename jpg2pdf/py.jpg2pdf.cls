/// IRIS (or Legacy Caché/Ensemble) class to invoke the jpg2pdf python Script from the Interoperability Platform
/// This code is only a demo and shuld be adapter to be inclued as an Interoperability Component (Business Operation)
/// with SETTINGS parameters defined via the mgmt Portal
Class py.jpg2pdf Extends %RegisteredObject
{

/// to Test the Code:
/// 1- Try it out from the command prompt, invoking python directly with:
///    python jpg2pdf.py .\img\Image1.jpg  .\img\pdf1.pdf
/// 2- Try it from this code:
///    set sc=##class(py.jpg2pdf).Run(".\img\image1.pdf",".\img\pdf2.pdf")
///    Write sc,!
/// Required  %System_Callout:U privilege.
ClassMethod Run(pImgPath As %String = "c:/dev/2021/embeddedPython/pyscripts/jpg2pdf/img/image1.jpg", pPDFPath As %String = "c:/dev/2021/embeddedPython/pyscripts/jpg2pdf/img/pdf1.pdf") As %Status
{
    #DIM tSC as %Status=$$$OK
    #DIM errObj as %Exception.AbstractException
    try {
        //2018+ Supports $ZF(-100)
        if ($SYSTEM.Version.GetMajor()>2017) {
            set tR=$ZF(-100,"/LOGCMD /STDERR=""c:\temp\pythonerrors.log"" ","python","c:/dev/2021/embeddedPython/pyscripts/jpg2pdf/jpg2pdf.py",pImgPath,pPDFPath)
        }else {
            Write "Please upgrade to IRIS!",!
            set tR=$ZF(-1,"python jpg2pdf.py "_pImgPath_" "_pPDFPath)
        }
        if (tR'=0) {
                Write "$ZF() Execution Failed with Code:",tR,! 
            }
    }catch(errObj) {
        Write "CATCH: ",errObj.DisplayString()
        set tSC=errObj.AsStatus()
    }
    quit tSC
}

}
