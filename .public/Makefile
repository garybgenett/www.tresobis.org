#!/usr/bin/make --makefile
################################################################################

override COMPOSER_ABSPATH := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
override COMPOSER_TEACHER := $(abspath $(COMPOSER_ABSPATH)/../Makefile)
override COMPOSER_FULLDIR := $(COMPOSER_ABSPATH)

override COMPOSER_TARGETS ?=
override COMPOSER_SUBDIRS ?=
override COMPOSER_DEPENDS ?=

override CSS ?= $(MDVIEWER_CSS_ALT)

########################################

override CNAME				:= tresobis.org

override SUBTREE			:= .public
override BRANCH				:= gh-pages
override MIRROR				:= ssh://git@github.com/garybgenett/$(CNAME).git

override LOG_FORMAT			:= %ai %H %s %d
override LOG_COUNT			:= 10

########################################

override SITE_SOURCE			:= $(COMPOSER_FULLDIR)
override SITE_PUBLIC			:= $(SITE_SOURCE)/$(SUBTREE)
override SITE_SEARCH			:= 1

override SITE_TITLE			:= "Tresobis: A Writing Collective"
override SITE_SUBTITLE			:= The Repressed Enigmatic Sphygmus Of Bounteous Intellect Speaks
override SITE_DESCRIPTION		:= Tresobis is a writing collective
override SITE_EXCERPT			:= Please expand on that...
override SITE_AUTHOR			:= Gary B. Genett
override SITE_LANGUAGE			:= en
override SITE_TIMEZONE			:= US/Pacific

override SITE_GOOGLEPLUS		:=
override SITE_FACEBOOK			:=
override SITE_LINKEDIN			:=
override SITE_TWITTER			:=
override SITE_GITHUB			:=

override SITE_GIT_REPO			:= git@github.com:garybgenett/$(CNAME).git
override SITE_ANALYTICS_ID		:=
override SITE_URL			:= http://www.$(CNAME)
override SITE_ROOT			:=
override SITE_SIDEBAR			:= right
override SITE_PERMALINK			:= :year/:month/:day/:title/
override SITE_DATE_FORMAT		:= YYYY-MM-DD
override SITE_TIME_FORMAT		:= HH:mm:ss
override SITE_FEED_TYPE			:= atom
override SITE_PER_PAGE			:= 10

override SITE_SIZE_BANNER		:= 128px
override SITE_SIZE_LOGO			:= 32px
override SITE_SIZE_SUBTITLE		:= 16px
override SITE_SIZE_MOBLE_NAV		:= 256px

override SITE_COLOR_BACKGROUND		:= \#202020
override SITE_COLOR_BACKGROUND_BLOCK	:= \#404040
override SITE_COLOR_BACKGROUND_FOOTER	:= \#000000
override SITE_COLOR_BACKGROUND_MOBILE	:= \#000000
override SITE_COLOR_BACKGROUND_WIDGET	:= \#404040
override SITE_COLOR_BORDER		:= \#808080
override SITE_COLOR_BORDER_WIDGET	:= \#808080
override SITE_COLOR_SHADOW_BLOCK	:= \#400000
override SITE_COLOR_SHADOW_TEXT		:= \#400000
override SITE_COLOR_TEXT_DEFAULT	:= \#f0f0f0
override SITE_COLOR_TEXT_GREY		:= \#808080
override SITE_COLOR_TEXT_LINK		:= \#f00000
override SITE_COLOR_TEXT_SIDEBAR	:= \#000000

override SITE_WIDGETS_ARCHIVES		:= History
override SITE_WIDGETS_CATEGORIES	:= Themes
override SITE_WIDGETS_RECENTS		:= Latest
override SITE_WIDGETS_TAGS		:= Authors
override SITE_WIDGETS_TAGS_CLOUD	:= Authors Cloud
override SITE_WIDGETS			:= \
	recent_posts \
	tagcloud_WORK \
	tag \
	category \
	archive

override SITE_MENU			:= \
	Home| \
	Books|books \
	$(SITE_WIDGETS_ARCHIVES)|archives

override SITE_SKIPS			:= \
	CNAME

########################################

include $(COMPOSER_TEACHER)
.DEFAULT_GOAL := generate

.PHONY: read fire
read: generate server
fire: publish deploy

################################################################################

override define GIT_DIR_BEGIN =
	if [ ! -L "$(COMPOSER_FULLDIR)/.git" ] && \
	   [ ! -d "$(COMPOSER_FULLDIR)/.git" ] && \
	   [   -d "$(COMPOSER_FULLDIR).git" ]; then \
		ln -sv "$(COMPOSER_FULLDIR).git" "$(COMPOSER_FULLDIR)/.git"; \
	fi
endef
override define GIT_DIR_END =
	if [ -L "$(COMPOSER_FULLDIR)/.git" ]; then \
		rm -v "$(COMPOSER_FULLDIR)/.git"; \
	fi
endef

.PHONY: generate
generate: subdirs
generate: HEXO_WORK_DONE

.PHONY: server
server: HEXO_WORK_server

.PHONY: publish
publish:
	$(call GIT_DIR_BEGIN)
	git subtree split -d --prefix "$(SUBTREE)" --branch "$(BRANCH)"
	git --no-pager log --max-count="$(LOG_COUNT)" --pretty=format:"$(LOG_FORMAT)" "$(BRANCH)"
	$(call GIT_DIR_END)

.PHONY: deploy
ifneq ($(MIRROR),)
deploy:
	$(call GIT_DIR_BEGIN)
	git push --mirror "$(MIRROR)"
	$(call GIT_DIR_END)
else
deploy: HEXO_WORK_deploy
endif

################################################################################
# end of file
################################################################################
