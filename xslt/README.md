Vorgehensweise:

--XML-Export der alten Personenseiten erstellen (Werkzeuge -> Daten exportieren)

--XSLT-Transformation mit dem Stylesheet ausführen (getestet mit Saxon-HE 9.6.0.7)
-->Inhalte der alten custom-fields (wp:postmeta) werden im content:encoded-Element zusammengebaut und automatisch in collapses gruppiert
-->beim Transformieren werden nur deutschsprachige Personenseiten berücksichtigt

--alte Links aktualisieren:
-->Regex, um Downloadlinks im alten XML-Export zu finden
http:\/\/www\.geographie\.nat\.uni-erlangen\.de\/wp-content\/uploads\/.+?pdf|txt|jpg|png|gif
-->Dateien runterladen mit
wget -i downloadlinks.txt
-->Heruntergeladene Dateien in die neue CMS-Instanz hochladen
--im transformierten XML-Export regex http:\/\/www\.geographie\.nat\.uni-erlangen\.de\/wp-content\/uploads\/ (und ggf. andere Links auf die alte Seite) ersetzen mit https://geographie.cms.rrze.uni-erlangen.de/files/[JAHRESORDNER]/[MONATSORDNER]/

--ggf. Kodierungsfehler/Sonderzeichenfehler beheben

--Transformierten, angepassten XML-Export in die neue CMS-Instanz importieren (Werkzeuge -> Daten importieren)
