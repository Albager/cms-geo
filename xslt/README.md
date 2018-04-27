## Vorgehensweise für Personenseiten:
- XML-Export der alten Personenseiten erstellen (Werkzeuge -> Daten exportieren -> Personen)
- XSLT-Transformation mit dem [XSLT-Stylesheet MigrateWPPersonKontakt](MigrateWPPersonKontakt.xsl) ausführen (getestet mit Saxon-HE 9.6.0.7)
  - Inhalte der alten custom-fields (wp:postmeta) werden im content:encoded-Element zusammengebaut und automatisch in collapses gruppiert
  - beim Transformieren werden nur deutschsprachige Personenseiten berücksichtigt
- alte Links aktualisieren:
  - Regex, um Downloadlinks im alten XML-Export zu finden: `http:\/\/www\.geographie\.nat\.uni-erlangen\.de\/wp-content\/uploads\/.+?(pdf|txt|jpg|png|gif|gpx|kml)`
  - Dateien runterladen mit `wget -i downloadlinks.txt`
- Heruntergeladene Dateien in die neue CMS-Instanz hochladen
- im transformierten XML-Export regex `http:\/\/www\.geographie\.nat\.uni-erlangen\.de\/wp-content\/uploads\/` (und ggf. andere Links auf die alte Seite) ersetzen mit `https://geographie.cms.rrze.uni-erlangen.de/files/[JAHRESORDNER]/[MONATSORDNER]/`
- ggf. Kodierungsfehler/Sonderzeichenfehler beheben
- Transformierten, angepassten XML-Export in die neue CMS-Instanz importieren (Werkzeuge -> Daten importieren)

## Vorgehensweise für (Unter-)Seiten:
- XML-Export der alten Seiten erstellen (Werkzeuge -> Daten exportieren)
- im [XSLT-Stylesheet MigrateWPChildPages](MigrateWPChildPages.xsl) die gewünschte Seiten-Id der Elternseite einstellen
- Transformation durchführen
- zweite Transformation mit [XSLT-Stylesheet MigrateWPChildPages_contentOnly](MigrateWPChildPages_contentOnly.xsl) durchführen
- im Output ggf. Links aktualisieren
- Copy&Paste der accordion-items in ein bestehendes accordion in der FAU-CMS-Instanz (kann beliebig angepasst werden)

## Vorgehensweise CSV aus Kontakte-XML-Export
- XML-Export aller Kontakte der (neuen) CMS-Instanz erstellen
- Transformation mit [XSLT-Stylesheet ExtractKontakt_CSV](ExtractKontakt_CSV.xsl) durchführen
- Der Ouput kann dann einfach in einem Tabellenkalkulationsprogramm weiterverwendet werden
- enthält die Spalten: title | link | wp:post_id | wp:post_name | fau_person_univis_id
