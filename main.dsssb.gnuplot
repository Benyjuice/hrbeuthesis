set table "main.dsssb.table"; set format "%.5f"
set samples 300.0; plot [x=-1.5:1.5] abs(sin(pi*x/1.5)/(pi*x/1.5))/3
