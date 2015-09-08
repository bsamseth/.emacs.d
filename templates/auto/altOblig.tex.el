(TeX-add-style-hook "altOblig.tex"
 (lambda ()
    (LaTeX-add-bibliographies
     "/home/bendik/bibliography/database")
    (TeX-add-symbols
     '("mean" 1)
     '("e" 1)
     '("curl" 1)
     '("pd" 2)
     "numberthis"
     "horline"
     "intfy"
     "baselinestretch")
    (TeX-run-style-hooks
     "fancyhdr"
     "comment"
     "pgfplots"
     "siunitx"
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
     "biblatex"
     "sorting=none"
     "backend=biber"
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
     "twocolumn"
     "11pt")))

