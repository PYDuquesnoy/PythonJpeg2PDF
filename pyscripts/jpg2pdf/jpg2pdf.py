#!/usr/bin/env python3
# Created By: Pierre-Yves Duquesnoy
# Created Date: 2021-04-30
# ===================================================
# Python Script to Transform a Jpeg image as a PDF page
# Command Line Syntax:
# py jpg2pdf <JpegImageInputFilePath> <PdfOutputFilePath>
# Modules needed:
# fpdf: tp generate the PDF
# Optional: Pillow, if iamge rotation is desired

import sys
from fpdf import FPDF
if (len(sys.argv)!=3):
    raise ValueError('Invalid Number of Arguments. Syntax is {sys.argv[0]} ImageFile PdfFile')

ImagePath=str(sys.argv[1])
PDFFile=str(sys.argv[2])
pdf=FPDF()
pdf.add_page()
pdf.image(ImagePath,0,0,210)   #210x297 for A4, we only specify with to keep image Ratio
pdf.output(PDFFile,"F")

