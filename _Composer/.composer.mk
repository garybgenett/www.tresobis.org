################################################################################
# composer settings file
################################################################################

override C_EXPORT_GITREPO		:= ssh://git@github.com/garybgenett/www.tresobis.org.git
override C_EXPORT_GITBNCH		:= gh-pages

override C_EXPORT_FIRACCT		:= gary@tresobis.org
override C_EXPORT_FIRPROJ		:= tresobis-site

################################################################################

override COMPOSER_EXPORTS		:= CNAME README.markdown .nojekyll
override COMPOSER_EXPORTS		+= .composer.mk .composer.yml .composer-*
override COMPOSER_EXPORTS		+= _header* _footer*
override COMPOSER_EXPORTS		+= .targets
ifneq ($(COMPOSER_CURDIR),)
override COMPOSER_SUBDIRS		:= .null
override COMPOSER_IGNORES		:= library
endif

########################################

override MAKEJOBS			:= 0

override c_site				:= 1
override c_logo				:= $(COMPOSER_ROOT)/_branding/logo.png
override c_icon				:= $(COMPOSER_ROOT)/_branding/logo.png
override c_css				:= custom

################################################################################
ifeq ($(COMPOSER_CURDIR),)
ifeq ($(filter $(COMPOSER_ROOT)/_Composer%,$(CURDIR)),)
################################################################################

ifeq ($(CURDIR),$(COMPOSER_ROOT))
.PHONY: $(notdir $(COMPOSER_ROOT))-export
$(notdir $(COMPOSER_ROOT))-export:
	@$(TOUCH) $(COMPOSER_ROOT)/.nojekyll
	@(cd $(COMPOSER_ROOT) && $(HOME)/.bashrc git-perms root)
endif

################################################################################
endif
endif
################################################################################
# end of file
################################################################################
