--XML-Export der alten Personenseiten erstellen

--XSLT-Transformation ausführen

--alte Links aktualisieren:
--Regex, um Downloadlinks im alten XML-Export zu finden
http:\/\/www\.geographie\.nat\.uni-erlangen\.de\/wp-content\/uploads\/.+?pdf|txt|jpg|png|gif
--Dateien runterladen mit
wget -i downloadlinks.txt
--im transformierten XML-Export ersetzen mit 
https://geographie.cms.rrze.uni-erlangen.de/files/[JAHRESORDNER]/[MONATSORDNER]/

--ggf. Kodierungsfehler/Sonderzeichenfehler beheben

--Transformierten, angepassten XML-Export in die neue CMS-Instanz importieren.
