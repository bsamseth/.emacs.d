(TeX-add-style-hook "oblig.tex"
 (lambda ()
    (LaTeX-add-environments
     "exercise")
    (TeX-add-symbols
     '("mean" 1)
     '("e" 1)
     '("curl" 1)
     '("pd" 2)
     '("newfig" 3)
     '("pythonscriptfromto" 4)
     '("pythonscript" 2)
     '("matlabscript" 2)
     "numberthis"
     "horline"
     "HRule")
    (TeX-run-style-hooks
     "fancyhdr"
     "pdfpages"
     "cancel"
     "import"
     "graphicx"
     "fullpage"
     "sectsty"
     "lipsum"
     "wasysym"
     "amsthm"
     "amssymb"
     "amsmath"
     "color"
     "hyperref"
     "listings"
     "alltt"
     ""
     "inputenc"
     "utf8"
     "babel"
     "norsk"
     "latex2e"
     "art11"
     "article"
     "11pt")))

