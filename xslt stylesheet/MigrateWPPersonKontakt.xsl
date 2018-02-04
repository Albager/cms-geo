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

    <!-- Ab hier Personen, nur deutsche Personenseiten -->
    <xsl:template match="item">
        <xsl:if test="not(matches(link, '/.*\?lang=en'))">
            <item>
                <xsl:apply-templates select="title, link, pubDate"/>

                <dc:creator>
                    <xsl:text disable-output-escaping="yes">&lt;![CDATA[so01zagy]]&gt;</xsl:text>
                </dc:creator>

                <xsl:copy-of select="guid"/>

                <description/>

                <!-- Ab hier wird der Inhalt der Personenseiten aus den alten custom fields zusammengebaut -->

                <content:encoded>

                    <xsl:text disable-output-escaping="yes">&lt;![CDATA[</xsl:text>
                    <xsl:value-of select="content:encoded" disable-output-escaping="yes"/>

                    <xsl:if
                        test="((wp:postmeta[wp:meta_key = 'curriculum_vitae']/wp:meta_value != '') or (wp:postmeta[wp:meta_key = 'publikationen']/wp:meta_value != '') or (wp:postmeta[wp:meta_key = 'lehre']/wp:meta_value != '') or (wp:postmeta[wp:meta_key = 'forschungsinteressen']/wp:meta_value != '') or (wp:postmeta[wp:meta_key = 'pers-forsch']/wp:meta_value != '') or (wp:postmeta[wp:meta_key = 'weiteres']/wp:meta_value != '') or (wp:postmeta[wp:meta_key = 'abschluss']/wp:meta_value != ''))">
                        <xsl:text disable-output-escaping="yes">[collapsibles]</xsl:text>

                        <xsl:if
                            test="wp:postmeta[wp:meta_key = 'curriculum_vitae']/wp:meta_value != ''">
                            <xsl:text disable-output-escaping="yes">[collapse title="Curriculum Vitae" color="natfak"]</xsl:text>
                            <xsl:value-of
                                select="wp:postmeta[wp:meta_key = 'curriculum_vitae']/wp:meta_value"
                                disable-output-escaping="yes"/>
                            <xsl:text disable-output-escaping="yes">[/collapse]</xsl:text>
                        </xsl:if>

                        <xsl:if
                            test="wp:postmeta[wp:meta_key = 'publikationen']/wp:meta_value != ''">
                            <xsl:text disable-output-escaping="yes">[collapse title="Publikationen" color="natfak"]</xsl:text>
                            <xsl:value-of
                                select="wp:postmeta[wp:meta_key = 'publikationen']/wp:meta_value"
                                disable-output-escaping="yes"/>
                            <xsl:text disable-output-escaping="yes">[/collapse]</xsl:text>
                        </xsl:if>

                        <xsl:if test="wp:postmeta[wp:meta_key = 'lehre']/wp:meta_value != ''">
                            <xsl:text disable-output-escaping="yes">[collapse title="Lehre" color="natfak"]</xsl:text>
                            <xsl:value-of select="wp:postmeta[wp:meta_key = 'lehre']/wp:meta_value"
                                disable-output-escaping="yes"/>
                            <xsl:text disable-output-escaping="yes">[/collapse]</xsl:text>
                        </xsl:if>

                        <xsl:if
                            test="((wp:postmeta[wp:meta_key = 'forschungsinteressen']/wp:meta_value != '') or (wp:postmeta[wp:meta_key = 'pers-forsch']/wp:meta_value != ''))">
                            <xsl:text disable-output-escaping="yes">[collapse title="Forschung" color="natfak"]</xsl:text>
                            <xsl:value-of
                                select="wp:postmeta[wp:meta_key = 'forschungsinteressen']/wp:meta_value"
                                disable-output-escaping="yes"/>
                            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                            <xsl:value-of
                                select="wp:postmeta[wp:meta_key = 'pers-forsch']/wp:meta_value"
                                disable-output-escaping="yes"/>

                            <xsl:text disable-output-escaping="yes">[/collapse]</xsl:text>
                        </xsl:if>

                        <xsl:if test="wp:postmeta[wp:meta_key = 'abschluss']/wp:meta_value != ''">
                            <xsl:text disable-output-escaping="yes">[collapse title="Abschlussarbeiten" color="natfak"]</xsl:text>
                            <xsl:value-of
                                select="wp:postmeta[wp:meta_key = 'abschluss']/wp:meta_value"
                                disable-output-escaping="yes"/>
                            <xsl:text disable-output-escaping="yes">[/collapse]</xsl:text>
                        </xsl:if>

                        <xsl:if test="wp:postmeta[wp:meta_key = 'weiteres']/wp:meta_value != ''">
                            <xsl:text disable-output-escaping="yes">[collapse title="Weiteres" color="natfak"]</xsl:text>
                            <xsl:value-of
                                select="wp:postmeta[wp:meta_key = 'weiteres']/wp:meta_value"
                                disable-output-escaping="yes"/>
                            <xsl:text disable-output-escaping="yes">[/collapse]</xsl:text>
                        </xsl:if>

                        <xsl:text disable-output-escaping="yes">[/collapsibles]</xsl:text>
                    </xsl:if>

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
                    <xsl:text disable-output-escaping="yes">&lt;![CDATA[person]]&gt;</xsl:text>
                </wp:post_type>

                <wp:post_password>
                    <xsl:text disable-output-escaping="yes">&lt;![CDATA[]]&gt;</xsl:text>
                </wp:post_password>

                <wp:is_sticky>0</wp:is_sticky>

                <!-- Hier werden die Kontaktkategorien ausgelesen und für die neue CMS-Instanz entsprechend umgeformt. Hinweis: Die alten Kontaktkategorien müssen in der neuen CMS-Instanz angelegt sein, damit das Ganze funktioniert -->

                <xsl:for-each select="category">
                    <xsl:element name="category">
                        <xsl:attribute name="domain">
                            <xsl:text disable-output-escaping="yes">persons_category</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="nicename">
                            <xsl:value-of select="@nicename"/>
                        </xsl:attribute>

                        <xsl:text disable-output-escaping="yes">&lt;![CDATA[</xsl:text>
                        <xsl:value-of select="self::*"/>
                        <xsl:text disable-output-escaping="yes">]]&gt;</xsl:text>
                    </xsl:element>
                </xsl:for-each>

                <!-- wp:postmeta bleibt leer -->
                <wp:postmeta/>
            </item>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
