<!--Mit diesem Stylesheet können alle Kinder-Seiten einer Seite, deren id unten eingegeben werden muss, aus dem WP-XML-Export aller Seiten extrahiert werden-->
<!--Es entsteht ein XML-Dokument, in dem man ggf. noch Links usw. ersetzen muss (analog Personen) und das man dann in die neue CMS Instanz importieren kann-->
<!--Alles bis auf content:encoded und categories (kommen nicht vor) ist identisch mit dem Personen/Kontakte-Stylesheet-->
<!--Die Inhalte der einzelnen Seiten werden automatisch in accordions gruppiert, die Anhand des ursprünglichen Seitentitels benannt werden-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:excerpt="http://wordpress.org/export/1.2/excerpt/"
    xmlns:content="http://purl.org/rss/1.0/modules/content/"
    xmlns:wfw="http://wellformedweb.org/CommentAPI/" xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:wp="http://wordpress.org/export/1.2/">
    
    <xsl:output indent="yes"
        cdata-section-elements="content:encoded wp:meta_value wp:author_login wp:author_email wp:author_display_name wp:author_first_name wp:author_last_name"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="rss">
        <rss>
            <xsl:apply-templates/>
        </rss>
    </xsl:template>
    
    <!-- Kopf -->
    <xsl:template match="channel">
        <channel>
            <xsl:apply-templates/>
        </channel>
    </xsl:template>
    
    <xsl:template match="title">
        <title>
            <xsl:value-of select="."/>
        </title>
    </xsl:template>
    
    <xsl:template match="link">
        <link>
            <xsl:value-of select="."/>
        </link>
    </xsl:template>
    
    <xsl:template match="description">
        <description>
            <xsl:value-of select="."/>
        </description>
    </xsl:template>
    
    <xsl:template match="pubDate">
        <pubDate>
            <xsl:value-of select="."/>
        </pubDate>
    </xsl:template>
    
    <xsl:template match="language">
        <language>
            <xsl:value-of select="."/>
        </language>
    </xsl:template>
    
    <xsl:template match="wp:wxr_version">
        <wp:wxr_version>
            <xsl:value-of select="."/>
        </wp:wxr_version>
    </xsl:template>
    
    <xsl:template match="wp:base_site_url">
        <wp:base_site_url>
            <xsl:value-of select="."/>
        </wp:base_site_url>
    </xsl:template>
    
    <xsl:template match="wp:base_blog_url">
        <wp:base_blog_url>
            <xsl:value-of select="."/>
        </wp:base_blog_url>
    </xsl:template>
    
    <xsl:template match="wp:author">
        <wp:author>
            <xsl:element name="wp:author_id">
                <xsl:value-of select="wp:author_id"/>
            </xsl:element>
            <xsl:element name="wp:author_login">
                <xsl:value-of select="wp:author_login"/>
            </xsl:element>
            <xsl:element name="wp:author_email">
                <xsl:value-of select="wp:author_email"/>
            </xsl:element>
            <xsl:element name="wp:author_display_name">
                <xsl:value-of select="wp:author_display_name"/>
            </xsl:element>
            <xsl:element name="wp:author_first_name">
                <xsl:value-of select="wp:author_first_name"/>
            </xsl:element>
            <xsl:element name="wp:author_last_name">
                <xsl:value-of select="wp:author_last_name"/>
            </xsl:element>
        </wp:author>
    </xsl:template>
    
    <xsl:template match="generator">
        <generator>
            <xsl:value-of select="."/>
        </generator>
    </xsl:template>
    
    <!-- Ab hier werden die Seiten gesammelt, die dem parent-Element (hier: id 3398) zugeordnet sind -->
    
    
    <xsl:template match="item">
        <xsl:if test="wp:post_parent=3398">
            <item>
                <xsl:apply-templates select="title, link, pubDate"/>
                
                <dc:creator>
                    <xsl:text disable-output-escaping="yes">&lt;![CDATA[so01zagy]]&gt;</xsl:text>
                </dc:creator>
                
                <xsl:copy-of select="guid"/>
                
                <description/>
                
                <!-- Ab hier wird der Inhalt der der Seiten ausgelesen und neu strukturiert -->
                
                <content:encoded>
                    
                    <xsl:text disable-output-escaping="yes">&lt;![CDATA[</xsl:text>
                    
                    <xsl:text disable-output-escaping="yes">[accordion-item title="</xsl:text>
                    
                    <xsl:value-of select="title" disable-output-escaping="yes"/>
                    
                    <xsl:text disable-output-escaping="yes">"]</xsl:text>
                    
                    <xsl:value-of select="content:encoded" disable-output-escaping="yes"/>
                    
                    <xsl:text disable-output-escaping="yes">[/accordion-item]</xsl:text>
                    
                    <xsl:text disable-output-escaping="yes">]]&gt;</xsl:text>
                    
                </content:encoded>
                
                <!-- Ab hier Wordpress Meta -->
                
                <excerpt:encoded/>
                
                <wp:post_id>
                    <xsl:value-of select="wp:post_id"/>
                </wp:post_id>
                
                <wp:post_date>
                    <xsl:text disable-output-escaping="yes">&lt;![CDATA[2017-12-06 16:27:41]]&gt;</xsl:text>
                </wp:post_date>
                
                <wp:post_date_gmt>
                    <xsl:text disable-output-escaping="yes">&lt;![CDATA[2017-12-06 15:27:41]]&gt;</xsl:text>
                </wp:post_date_gmt>
                
                <wp:comment_status>
                    <xsl:text disable-output-escaping="yes">&lt;![CDATA[closed]]&gt;</xsl:text>
                </wp:comment_status>
                
                <wp:ping_status>
                    <xsl:text disable-output-escaping="yes">&lt;![CDATA[closed]]&gt;</xsl:text>
                </wp:ping_status>
                
                <wp:post_name>
                    <xsl:text disable-output-escaping="yes">&lt;![CDATA[</xsl:text>
                    <xsl:value-of select="wp:post_name"/>
                    <xsl:text disable-output-escaping="yes">]]&gt;</xsl:text>
                </wp:post_name>
                
                <wp:status>
                    <xsl:text disable-output-escaping="yes">&lt;![CDATA[publish]]&gt;</xsl:text>
                </wp:status>
                
                <wp:post_parent>0</wp:post_parent>
                
                <wp:menu_order>0</wp:menu_order>
                
                <wp:post_type>
                    <xsl:text disable-output-escaping="yes">&lt;![CDATA[page]]&gt;</xsl:text>
                </wp:post_type>
                
                <wp:post_password>
                    <xsl:text disable-output-escaping="yes">&lt;![CDATA[]]&gt;</xsl:text>
                </wp:post_password>
                
                <wp:is_sticky>0</wp:is_sticky>
                
                <!-- wp:postmeta bleibt leer -->
                <wp:postmeta/>
            </item>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
