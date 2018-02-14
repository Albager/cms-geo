<!--Mit diesem Stylesheet werden nun alle XML-Elemente entfernt, so dass man den ganzen Inhalt des Outputs in der CMS-Instanz nur noch...
    
[collapsibles]
[collapse title="Name" color="natfak"]
[accordion]

[HIER HIN]

[/accordion]
[/collapse]
[/collapsibles]

...kopieren muss-->

<!--Man kann natürlich auch jede andere Struktur erzeugen oder bspw. noch Überschriften auslesen und zum Gruppieren in Ziehharmonikas verwenden-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:excerpt="http://wordpress.org/export/1.2/excerpt/"
    xmlns:content="http://purl.org/rss/1.0/modules/content/"
    xmlns:wfw="http://wellformedweb.org/CommentAPI/" xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:wp="http://wordpress.org/export/1.2/">
    
    <xsl:output omit-xml-declaration="yes"/>
    
    <xsl:template match="text()"/>
    
    <xsl:template match="item">
        <xsl:value-of select="content:encoded" disable-output-escaping="yes"/>
        <xsl:text>
</xsl:text>
    </xsl:template>
    
</xsl:stylesheet>
