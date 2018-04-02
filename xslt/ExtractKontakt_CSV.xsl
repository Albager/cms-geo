<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:excerpt="http://wordpress.org/export/1.2/excerpt/"
    xmlns:content="http://purl.org/rss/1.0/modules/content/"
    xmlns:wfw="http://wellformedweb.org/CommentAPI/" xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:wp="http://wordpress.org/export/1.2/" exclude-result-prefixes="xsl excerpt content wfw wp dc">
    
    <xsl:output method="text" indent="yes" omit-xml-declaration="yes"
        cdata-section-elements="content:encoded wp:meta_value wp:author_login wp:author_email wp:author_display_name wp:author_first_name wp:author_last_name"/>
    
    <xsl:template match="text()"/>
    
    <xsl:template match="/">
        <xsl:text>title;link;wp:post_id;wp:post_name;fau_person_univis_id</xsl:text>
        <xsl:text>&#xa;</xsl:text>
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="item">        
        <item>                
                <xsl:value-of select="title"/>
                <xsl:text>;</xsl:text>
                <xsl:value-of select="link"/>
                <xsl:text>;</xsl:text>
                <xsl:value-of select="wp:post_id"/>
                <xsl:text>;</xsl:text>
                <xsl:value-of select="wp:post_name"/>
                <xsl:text>;</xsl:text>
                <xsl:if test="wp:postmeta[wp:meta_key = 'fau_person_univis_id']/wp:meta_value != ''">
                    <xsl:value-of
                        select="wp:postmeta[wp:meta_key = 'fau_person_univis_id']/wp:meta_value"
                        disable-output-escaping="yes"/>                    
                </xsl:if>
            </item>
        <xsl:text>&#xa;</xsl:text>        
    </xsl:template>
    
</xsl:stylesheet>
