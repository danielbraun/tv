index.html: style.xsl data.xml 
	xsltproc $^ > $@
