ifneq ($(filter $(DISTRIBUTION), debian qubuntu),)
    DEBIAN_BUILD_DIRS := debian
    SOURCE_COPY_IN := source-debian-quilt-copy-in
endif

RPM_SPEC_FILES := rpm_spec/input-proxy.spec

source-debian-quilt-copy-in: VERSION = $(shell $(DEBIAN_PARSER) changelog --package-version $(ORIG_SRC)/$(DEBIAN_BUILD_DIRS)/changelog)
source-debian-quilt-copy-in: NAME = $(shell $(DEBIAN_PARSER) changelog --package-name $(ORIG_SRC)/$(DEBIAN_BUILD_DIRS)/changelog)
source-debian-quilt-copy-in: ORIG_FILE = "$(CHROOT_DIR)/$(DIST_SRC)/../$(NAME)_$(VERSION).orig.tar.gz"
source-debian-quilt-copy-in:
    tar cfz $(ORIG_FILE) --exclude-vcs --exclude=rpm --exclude=pkgs --exclude=deb --exclude=debian -C $(CHROOT_DIR)/$(DIST_SRC) .
