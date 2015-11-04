all:
	ruby -r './template_engine' -e 'TemplateEngine.new.build'
	cd output && (xelatex template.tex > /dev/null)