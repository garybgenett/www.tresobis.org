################################################################################
# composer settings file
################################################################################
ifneq ($(COMPOSER_CURDIR),)
################################################################################

override COMPOSER_IGNORES		:= 404.md index.md images

################################################################################

index.html: $(COMPOSER_ROOT)/library/index-include.md.cms

################################################################################
endif
################################################################################
# end of file
################################################################################
