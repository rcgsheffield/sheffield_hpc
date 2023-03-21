srcdir = /home/$USER/software/sources/php/php-src
builddir = /home/$USER/software/sources/php/php-src
top_srcdir = /home/$USER/software/sources/php/php-src
top_builddir = /home/$USER/software/sources/php/php-src
EGREP = /bin/grep -E
SED = /bin/sed
CONFIGURE_COMMAND = './configure' '--prefix=/usr/local/packages/apps/phoronixtestsuite/php-8.0.0-dev/' '--with-curl' '--with-sockets' '--with-openssl' '--with-xmlrpc' '--with-zip' '--with-gd' '--with-jpeg-dir' '--with-zlib' 'PKG_CONFIG_PATH=/home/$USER/software/installed/lib/pkgconfig/:/home/$USER/software/installed/lib64/pkgconfig/'
CONFIGURE_OPTIONS = '--prefix=/usr/local/packages/apps/phoronixtestsuite/php-8.0.0-dev/' '--with-curl' '--with-sockets' '--with-openssl' '--with-xmlrpc' '--with-zip' '--with-gd' '--with-jpeg-dir' '--with-zlib' 'PKG_CONFIG_PATH=/home/$USER/software/installed/lib/pkgconfig/:/home/$USER/software/installed/lib64/pkgconfig/'
PHP_MAJOR_VERSION = 8
PHP_MINOR_VERSION = 0
PHP_RELEASE_VERSION = 0
PHP_EXTRA_VERSION = -dev
AWK = gawk
YFLAGS = -Wall
YACC = bison
RE2C = re2c
RE2C_FLAGS =
SHLIB_SUFFIX_NAME = so
SHLIB_DL_SUFFIX_NAME = so
PHP_CLI_OBJS = sapi/cli/php_cli.lo sapi/cli/php_http_parser.lo sapi/cli/php_cli_server.lo sapi/cli/ps_title.lo sapi/cli/php_cli_process_title.lo
PHP_EXECUTABLE = $(top_builddir)/$(SAPI_CLI_PATH)
SAPI_CLI_PATH = sapi/cli/php
BUILD_CLI = $(LIBTOOL) --mode=link $(CC) -export-dynamic $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) $(EXTRA_LDFLAGS_PROGRAM) $(LDFLAGS) $(PHP_RPATHS) $(PHP_GLOBAL_OBJS:.lo=.o) $(PHP_BINARY_OBJS:.lo=.o) $(PHP_CLI_OBJS:.lo=.o) $(EXTRA_LIBS) $(ZEND_EXTRA_LIBS) -o $(SAPI_CLI_PATH)
PHP_PHPDBG_CFLAGS = -D_GNU_SOURCE -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1
PHP_PHPDBG_FILES = phpdbg.c phpdbg_parser.c phpdbg_lexer.c phpdbg_prompt.c phpdbg_help.c phpdbg_break.c phpdbg_print.c phpdbg_bp.c phpdbg_opcode.c phpdbg_list.c phpdbg_utils.c phpdbg_info.c phpdbg_cmd.c phpdbg_set.c phpdbg_frame.c phpdbg_watch.c phpdbg_btree.c phpdbg_sigsafe.c phpdbg_wait.c phpdbg_io.c phpdbg_eol.c phpdbg_out.c
PHPDBG_EXTRA_LIBS =
PHP_PHPDBG_OBJS = sapi/phpdbg/phpdbg.lo sapi/phpdbg/phpdbg_parser.lo sapi/phpdbg/phpdbg_lexer.lo sapi/phpdbg/phpdbg_prompt.lo sapi/phpdbg/phpdbg_help.lo sapi/phpdbg/phpdbg_break.lo sapi/phpdbg/phpdbg_print.lo sapi/phpdbg/phpdbg_bp.lo sapi/phpdbg/phpdbg_opcode.lo sapi/phpdbg/phpdbg_list.lo sapi/phpdbg/phpdbg_utils.lo sapi/phpdbg/phpdbg_info.lo sapi/phpdbg/phpdbg_cmd.lo sapi/phpdbg/phpdbg_set.lo sapi/phpdbg/phpdbg_frame.lo sapi/phpdbg/phpdbg_watch.lo sapi/phpdbg/phpdbg_btree.lo sapi/phpdbg/phpdbg_sigsafe.lo sapi/phpdbg/phpdbg_wait.lo sapi/phpdbg/phpdbg_io.lo sapi/phpdbg/phpdbg_eol.lo sapi/phpdbg/phpdbg_out.lo
BUILD_BINARY = sapi/phpdbg/phpdbg
BUILD_SHARED = sapi/phpdbg/libphpdbg.la
BUILD_PHPDBG = $(LIBTOOL) --mode=link $(CC) -export-dynamic $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) $(EXTRA_LDFLAGS_PROGRAM) $(LDFLAGS) $(PHP_RPATHS) $(PHP_GLOBAL_OBJS:.lo=.o) $(PHP_BINARY_OBJS:.lo=.o) $(PHP_PHPDBG_OBJS:.lo=.o) $(EXTRA_LIBS) $(PHPDBG_EXTRA_LIBS) $(ZEND_EXTRA_LIBS) $(PHP_FRAMEWORKS) -o $(BUILD_BINARY)
BUILD_PHPDBG_SHARED = $(LIBTOOL) --mode=link $(CC) -shared -Wl,-soname,libphpdbg.so -export-dynamic $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) $(EXTRA_LDFLAGS_PROGRAM) $(LDFLAGS) $(PHP_RPATHS) $(PHP_GLOBAL_OBJS) $(PHP_BINARY_OBJS) $(PHP_PHPDBG_OBJS) $(EXTRA_LIBS) $(PHPDBG_EXTRA_LIBS) $(ZEND_EXTRA_LIBS) \-DPHPDBG_SHARED -o $(BUILD_SHARED)
PHP_CGI_OBJS = sapi/cgi/cgi_main.lo
SAPI_CGI_PATH = sapi/cgi/php-cgi
BUILD_CGI = $(LIBTOOL) --mode=link $(CC) -export-dynamic $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) $(EXTRA_LDFLAGS_PROGRAM) $(LDFLAGS) $(PHP_RPATHS) $(PHP_GLOBAL_OBJS:.lo=.o) $(PHP_BINARY_OBJS:.lo=.o) $(PHP_FASTCGI_OBJS:.lo=.o) $(PHP_CGI_OBJS:.lo=.o) $(EXTRA_LIBS) $(ZEND_EXTRA_LIBS) -o $(SAPI_CGI_PATH)
PROG_SENDMAIL = /usr/sbin/sendmail
OPENSSL_SHARED_LIBADD =
SQLITE3_SHARED_LIBADD =
ZLIB_SHARED_LIBADD =
CURL_SHARED_LIBADD =
DOM_SHARED_LIBADD =
FILTER_SHARED_LIBADD =
ICONV_SHARED_LIBADD =
DASM_FLAGS = -D X64=1
shared_objects_opcache = ext/opcache/ZendAccelerator.lo ext/opcache/zend_accelerator_blacklist.lo ext/opcache/zend_accelerator_debug.lo ext/opcache/zend_accelerator_hash.lo ext/opcache/zend_accelerator_module.lo ext/opcache/zend_persist.lo ext/opcache/zend_persist_calc.lo ext/opcache/zend_file_cache.lo ext/opcache/zend_shared_alloc.lo ext/opcache/zend_accelerator_util_funcs.lo ext/opcache/shared_alloc_shm.lo ext/opcache/shared_alloc_mmap.lo ext/opcache/shared_alloc_posix.lo ext/opcache/Optimizer/zend_optimizer.lo ext/opcache/Optimizer/pass1.lo ext/opcache/Optimizer/pass3.lo ext/opcache/Optimizer/optimize_func_calls.lo ext/opcache/Optimizer/block_pass.lo ext/opcache/Optimizer/optimize_temp_vars_5.lo ext/opcache/Optimizer/nop_removal.lo ext/opcache/Optimizer/compact_literals.lo ext/opcache/Optimizer/zend_cfg.lo ext/opcache/Optimizer/zend_dfg.lo ext/opcache/Optimizer/dfa_pass.lo ext/opcache/Optimizer/zend_ssa.lo ext/opcache/Optimizer/zend_inference.lo ext/opcache/Optimizer/zend_func_info.lo ext/opcache/Optimizer/zend_call_graph.lo ext/opcache/Optimizer/sccp.lo ext/opcache/Optimizer/scdf.lo ext/opcache/Optimizer/dce.lo ext/opcache/Optimizer/escape_analysis.lo ext/opcache/Optimizer/compact_vars.lo ext/opcache/Optimizer/zend_dump.lo ext/opcache/jit/zend_jit.lo ext/opcache/jit/zend_jit_vm_helpers.lo
OPCACHE_SHARED_LIBADD = -lrt
PDO_SQLITE_SHARED_LIBADD =
SESSION_SHARED_LIBADD =
SIMPLEXML_SHARED_LIBADD =
XML_SHARED_LIBADD =
XMLREADER_SHARED_LIBADD =
XMLWRITER_SHARED_LIBADD =
ZIP_SHARED_LIBADD =
PHP_INSTALLED_SAPIS = cli phpdbg cgi
PHP_FASTCGI_OBJS = main/fastcgi.lo
PHP_SAPI_OBJS = main/internal_functions.lo
PHP_BINARY_OBJS = main/internal_functions_cli.lo
PHP_GLOBAL_OBJS = ext/date/php_date.lo ext/date/lib/astro.lo ext/date/lib/dow.lo ext/date/lib/parse_date.lo ext/date/lib/parse_tz.lo ext/date/lib/timelib.lo ext/date/lib/tm2unixtime.lo ext/date/lib/unixtime2tm.lo ext/date/lib/parse_iso_intervals.lo ext/date/lib/interval.lo ext/libxml/libxml.lo ext/openssl/openssl.lo ext/openssl/xp_ssl.lo ext/pcre/pcre2lib/pcre2_auto_possess.lo ext/pcre/pcre2lib/pcre2_chartables.lo ext/pcre/pcre2lib/pcre2_compile.lo ext/pcre/pcre2lib/pcre2_config.lo ext/pcre/pcre2lib/pcre2_context.lo ext/pcre/pcre2lib/pcre2_dfa_match.lo ext/pcre/pcre2lib/pcre2_error.lo ext/pcre/pcre2lib/pcre2_jit_compile.lo ext/pcre/pcre2lib/pcre2_maketables.lo ext/pcre/pcre2lib/pcre2_match.lo ext/pcre/pcre2lib/pcre2_match_data.lo ext/pcre/pcre2lib/pcre2_newline.lo ext/pcre/pcre2lib/pcre2_ord2utf.lo ext/pcre/pcre2lib/pcre2_pattern_info.lo ext/pcre/pcre2lib/pcre2_serialize.lo ext/pcre/pcre2lib/pcre2_string_utils.lo ext/pcre/pcre2lib/pcre2_study.lo ext/pcre/pcre2lib/pcre2_substitute.lo ext/pcre/pcre2lib/pcre2_substring.lo ext/pcre/pcre2lib/pcre2_tables.lo ext/pcre/pcre2lib/pcre2_ucd.lo ext/pcre/pcre2lib/pcre2_valid_utf.lo ext/pcre/pcre2lib/pcre2_xclass.lo ext/pcre/pcre2lib/pcre2_find_bracket.lo ext/pcre/pcre2lib/pcre2_convert.lo ext/pcre/pcre2lib/pcre2_extuni.lo ext/pcre/pcre2lib/pcre2_script_run.lo ext/pcre/php_pcre.lo ext/sqlite3/sqlite3.lo ext/zlib/zlib.lo ext/zlib/zlib_fopen_wrapper.lo ext/zlib/zlib_filter.lo ext/ctype/ctype.lo ext/curl/interface.lo ext/curl/multi.lo ext/curl/share.lo ext/curl/curl_file.lo ext/dom/php_dom.lo ext/dom/attr.lo ext/dom/document.lo ext/dom/domexception.lo ext/dom/parentnode.lo ext/dom/processinginstruction.lo ext/dom/cdatasection.lo ext/dom/documentfragment.lo ext/dom/domimplementation.lo ext/dom/element.lo ext/dom/node.lo ext/dom/characterdata.lo ext/dom/documenttype.lo ext/dom/entity.lo ext/dom/nodelist.lo ext/dom/text.lo ext/dom/comment.lo ext/dom/entityreference.lo ext/dom/notation.lo ext/dom/xpath.lo ext/dom/dom_iterators.lo ext/dom/namednodemap.lo ext/fileinfo/fileinfo.lo ext/fileinfo/libmagic/apprentice.lo ext/fileinfo/libmagic/apptype.lo ext/fileinfo/libmagic/ascmagic.lo ext/fileinfo/libmagic/cdf.lo ext/fileinfo/libmagic/cdf_time.lo ext/fileinfo/libmagic/compress.lo ext/fileinfo/libmagic/encoding.lo ext/fileinfo/libmagic/fsmagic.lo ext/fileinfo/libmagic/funcs.lo ext/fileinfo/libmagic/is_json.lo ext/fileinfo/libmagic/is_tar.lo ext/fileinfo/libmagic/magic.lo ext/fileinfo/libmagic/print.lo ext/fileinfo/libmagic/readcdf.lo ext/fileinfo/libmagic/softmagic.lo ext/fileinfo/libmagic/der.lo ext/fileinfo/libmagic/buffer.lo ext/filter/filter.lo ext/filter/sanitizing_filters.lo ext/filter/logical_filters.lo ext/filter/callback_filter.lo ext/hash/hash.lo ext/hash/hash_md.lo ext/hash/hash_sha.lo ext/hash/hash_ripemd.lo ext/hash/hash_haval.lo ext/hash/hash_tiger.lo ext/hash/hash_gost.lo ext/hash/hash_snefru.lo ext/hash/hash_whirlpool.lo ext/hash/hash_adler32.lo ext/hash/hash_crc32.lo ext/hash/hash_fnv.lo ext/hash/hash_joaat.lo ext/hash/sha3/generic64lc/KeccakP-1600-opt64.lo ext/hash/sha3/generic64lc/KeccakHash.lo ext/hash/sha3/generic64lc/KeccakSponge.lo ext/hash/hash_sha3.lo ext/iconv/iconv.lo ext/json/json.lo ext/json/json_encoder.lo ext/json/json_parser.lo ext/json/json_scanner.lo ext/pdo/pdo.lo ext/pdo/pdo_dbh.lo ext/pdo/pdo_stmt.lo ext/pdo/pdo_sql_parser.lo ext/pdo/pdo_sqlstate.lo ext/pdo_sqlite/pdo_sqlite.lo ext/pdo_sqlite/sqlite_driver.lo ext/pdo_sqlite/sqlite_statement.lo ext/phar/util.lo ext/phar/tar.lo ext/phar/zip.lo ext/phar/stream.lo ext/phar/func_interceptors.lo ext/phar/dirstream.lo ext/phar/phar.lo ext/phar/phar_object.lo ext/phar/phar_path_check.lo ext/posix/posix.lo ext/reflection/php_reflection.lo ext/session/mod_user_class.lo ext/session/session.lo ext/session/mod_files.lo ext/session/mod_mm.lo ext/session/mod_user.lo ext/simplexml/simplexml.lo ext/spl/php_spl.lo ext/spl/spl_functions.lo ext/spl/spl_engine.lo ext/spl/spl_iterators.lo ext/spl/spl_array.lo ext/spl/spl_directory.lo ext/spl/spl_exceptions.lo ext/spl/spl_observer.lo ext/spl/spl_dllist.lo ext/spl/spl_heap.lo ext/spl/spl_fixedarray.lo ext/standard/crypt_freesec.lo ext/standard/crypt_blowfish.lo ext/standard/crypt_sha512.lo ext/standard/crypt_sha256.lo ext/standard/php_crypt_r.lo ext/standard/array.lo ext/standard/base64.lo ext/standard/basic_functions.lo ext/standard/browscap.lo ext/standard/crc32.lo ext/standard/crypt.lo ext/standard/datetime.lo ext/standard/dir.lo ext/standard/dl.lo ext/standard/dns.lo ext/standard/exec.lo ext/standard/file.lo ext/standard/filestat.lo ext/standard/flock_compat.lo ext/standard/formatted_print.lo ext/standard/fsock.lo ext/standard/head.lo ext/standard/html.lo ext/standard/image.lo ext/standard/info.lo ext/standard/iptc.lo ext/standard/lcg.lo ext/standard/link.lo ext/standard/mail.lo ext/standard/math.lo ext/standard/md5.lo ext/standard/metaphone.lo ext/standard/microtime.lo ext/standard/pack.lo ext/standard/pageinfo.lo ext/standard/quot_print.lo ext/standard/rand.lo ext/standard/mt_rand.lo ext/standard/soundex.lo ext/standard/string.lo ext/standard/scanf.lo ext/standard/syslog.lo ext/standard/type.lo ext/standard/uniqid.lo ext/standard/url.lo ext/standard/var.lo ext/standard/versioning.lo ext/standard/assert.lo ext/standard/strnatcmp.lo ext/standard/levenshtein.lo ext/standard/incomplete_class.lo ext/standard/url_scanner_ex.lo ext/standard/ftp_fopen_wrapper.lo ext/standard/http_fopen_wrapper.lo ext/standard/php_fopen_wrapper.lo ext/standard/credits.lo ext/standard/css.lo ext/standard/var_unserializer.lo ext/standard/ftok.lo ext/standard/sha1.lo ext/standard/user_filters.lo ext/standard/uuencode.lo ext/standard/filters.lo ext/standard/proc_open.lo ext/standard/streamsfuncs.lo ext/standard/http.lo ext/standard/password.lo ext/standard/random.lo ext/standard/net.lo ext/standard/hrtime.lo ext/tokenizer/tokenizer.lo ext/tokenizer/tokenizer_data.lo ext/xml/xml.lo ext/xml/compat.lo ext/xmlreader/php_xmlreader.lo ext/xmlwriter/php_xmlwriter.lo ext/zip/php_zip.lo ext/zip/zip_stream.lo TSRM/TSRM.lo main/main.lo main/snprintf.lo main/spprintf.lo main/fopen_wrappers.lo main/alloca.lo main/php_scandir.lo main/php_ini.lo main/SAPI.lo main/rfc1867.lo main/php_content_types.lo main/strlcpy.lo main/strlcat.lo main/explicit_bzero.lo main/reentrancy.lo main/php_variables.lo main/php_ticks.lo main/network.lo main/php_open_temporary_file.lo main/output.lo main/getopt.lo main/php_syslog.lo main/streams/streams.lo main/streams/cast.lo main/streams/memory.lo main/streams/filter.lo main/streams/plain_wrapper.lo main/streams/userspace.lo main/streams/transports.lo main/streams/xp_socket.lo main/streams/mmap.lo main/streams/glob_wrapper.lo Zend/zend_language_parser.lo Zend/zend_language_scanner.lo Zend/zend_ini_parser.lo Zend/zend_ini_scanner.lo Zend/zend_alloc.lo Zend/zend_compile.lo Zend/zend_constants.lo Zend/zend_dtrace.lo Zend/zend_execute_API.lo Zend/zend_highlight.lo Zend/zend_llist.lo Zend/zend_vm_opcodes.lo Zend/zend_opcode.lo Zend/zend_operators.lo Zend/zend_ptr_stack.lo Zend/zend_stack.lo Zend/zend_variables.lo Zend/zend.lo Zend/zend_API.lo Zend/zend_extensions.lo Zend/zend_hash.lo Zend/zend_list.lo Zend/zend_builtin_functions.lo Zend/zend_attributes.lo Zend/zend_execute.lo Zend/zend_ini.lo Zend/zend_sort.lo Zend/zend_multibyte.lo Zend/zend_ts_hash.lo Zend/zend_stream.lo Zend/zend_iterators.lo Zend/zend_interfaces.lo Zend/zend_exceptions.lo Zend/zend_strtod.lo Zend/zend_gc.lo Zend/zend_closures.lo Zend/zend_weakrefs.lo Zend/zend_float.lo Zend/zend_string.lo Zend/zend_signal.lo Zend/zend_generators.lo Zend/zend_virtual_cwd.lo Zend/zend_ast.lo Zend/zend_objects.lo Zend/zend_object_handlers.lo Zend/zend_objects_API.lo Zend/zend_default_classes.lo Zend/zend_inheritance.lo Zend/zend_smart_str.lo Zend/zend_cpuinfo.lo Zend/zend_gdb.lo
PHP_BINARIES = cli phpdbg cgi
PHP_MODULES =
PHP_ZEND_EX = $(phplibdir)/opcache.la
EXT_LIBS =
abs_builddir = /home/$USER/software/sources/php/php-src
abs_srcdir = /home/$USER/software/sources/php/php-src
bindir = ${exec_prefix}/bin
sbindir = ${exec_prefix}/sbin
exec_prefix = ${prefix}
program_prefix =
program_suffix =
includedir = ${prefix}/include
libdir = ${exec_prefix}/lib/php
mandir = ${datarootdir}/man
phplibdir = /home/$USER/software/sources/php/php-src/modules
phptempdir = /home/$USER/software/sources/php/php-src/libs
prefix = /usr/local/packages/apps/phoronixtestsuite/php-8.0.0-dev
localstatedir = ${prefix}/var
datadir = ${datarootdir}/php
datarootdir = /usr/local/packages/apps/phoronixtestsuite/php-8.0.0-dev/php
sysconfdir = ${prefix}/etc
EXEEXT =
CC = gcc
CFLAGS = $(CFLAGS_CLEAN) -prefer-non-pic -static
CFLAGS_CLEAN = -I/usr/local/packages/dev/gcc/8.2.0/include -fvisibility=hidden -Wall -Wextra -Wno-strict-aliasing -Wno-implicit-fallthrough -Wno-unused-parameter -Wno-sign-compare -Wno-clobbered -DZEND_SIGNALS $(PROF_FLAGS)
CPP = gcc -E
CPPFLAGS = -I/usr/local/packages/dev/gcc/8.2.0/include
CXX = g++
CXXFLAGS = -prefer-non-pic -static $(PROF_FLAGS)
CXXFLAGS_CLEAN =
DEBUG_CFLAGS =
EXTENSION_DIR = /usr/local/packages/apps/phoronixtestsuite/php-8.0.0-dev/lib/php/extensions/no-debug-non-zts-20200804
EXTRA_LDFLAGS = -L/home/$USER/software/installed/lib -L/home/$USER/software/installed/lib64
EXTRA_LDFLAGS_PROGRAM = -Wl,-zcommon-page-size=2097152 -Wl,-zmax-page-size=2097152 -L/home/$USER/software/installed/lib -L/home/$USER/software/installed/lib64
EXTRA_LIBS = -lcrypt -lresolv -lcrypt -lrt -lutil -lrt -lm -ldl -lxml2 -lssl -lcrypto -lsqlite3 -lz -lcurl -lxml2 -lsqlite3 -lxml2 -lxml2 -lxml2 -lxml2 -lzip -lcrypt
ZEND_EXTRA_LIBS =
INCLUDES = -I/home/$USER/software/sources/php/php-src/ext/date/lib -I/home/$USER/software/installed/include/libxml2 -I/home/$USER/software/installed/include -I$(top_builddir)/TSRM -I$(top_builddir)/Zend
EXTRA_INCLUDES =
INCLUDE_PATH = .:
INSTALL_IT =
LFLAGS =
LIBTOOL = $(SHELL) $(top_builddir)/libtool --silent --preserve-dup-deps
LN_S = ln -s
NATIVE_RPATHS = -Wl,-rpath,/home/$USER/software/installed/lib -Wl,-rpath,/home/$USER/software/installed/lib64
PEAR_INSTALLDIR =
PHP_LDFLAGS = -L/home/$USER/software/installed/lib -L/home/$USER/software/installed/lib64
PHP_LIBS =
OVERALL_TARGET =
PHP_RPATHS = -R /home/$USER/software/installed/lib -R /home/$USER/software/installed/lib64
PHP_SAPI = none
PHP_VERSION = 8.0.0-dev
PHP_VERSION_ID = 80000
SHELL = /bin/sh
SHARED_LIBTOOL = $(LIBTOOL)
PHP_FRAMEWORKS =
PHP_FRAMEWORKPATH =
INSTALL_HEADERS = sapi/cli/cli.h ext/date/php_date.h ext/date/lib/timelib.h ext/date/lib/timelib_config.h ext/libxml/php_libxml.h ext/pcre/php_pcre.h ext/pcre/pcre2lib/ ext/dom/xml_common.h ext/filter/php_filter.h ext/hash/php_hash.h ext/hash/php_hash_md.h ext/hash/php_hash_sha.h ext/hash/php_hash_ripemd.h ext/hash/php_hash_haval.h ext/hash/php_hash_tiger.h ext/hash/php_hash_gost.h ext/hash/php_hash_snefru.h ext/hash/php_hash_whirlpool.h ext/hash/php_hash_adler32.h ext/hash/php_hash_crc32.h ext/hash/php_hash_fnv.h ext/hash/php_hash_joaat.h ext/hash/php_hash_sha3.h ext/iconv/ ext/json/php_json.h ext/json/php_json_parser.h ext/json/php_json_scanner.h ext/pdo/php_pdo.h ext/pdo/php_pdo_driver.h ext/pdo/php_pdo_error.h ext/phar/php_phar.h ext/session/php_session.h ext/session/mod_files.h ext/session/mod_user.h ext/simplexml/php_simplexml.h ext/simplexml/php_simplexml_exports.h ext/spl/php_spl.h ext/spl/spl_array.h ext/spl/spl_directory.h ext/spl/spl_engine.h ext/spl/spl_exceptions.h ext/spl/spl_functions.h ext/spl/spl_iterators.h ext/spl/spl_observer.h ext/spl/spl_dllist.h ext/spl/spl_heap.h ext/spl/spl_fixedarray.h ext/standard/ ext/xml/ Zend/ TSRM/ include/ main/ main/streams/
all_targets = $(OVERALL_TARGET) $(PHP_MODULES) $(PHP_ZEND_EX) $(PHP_BINARIES) pharcmd
install_targets = install-modules install-binaries install-build install-headers install-programs install-pharcmd
install_binary_targets = install-cli install-phpdbg install-cgi
mkinstalldirs = $(top_srcdir)/build/shtool mkdir -p
INSTALL = $(top_srcdir)/build/shtool install -c
INSTALL_DATA = $(INSTALL) -m 644

DEFS = -I$(top_builddir)/include -I$(top_builddir)/main -I$(top_srcdir)
COMMON_FLAGS = $(DEFS) $(INCLUDES) $(EXTRA_INCLUDES) $(CPPFLAGS) $(PHP_FRAMEWORKPATH)

all: $(all_targets)
	@echo
	@echo "Build complete."
	@echo "Don't forget to run 'make test'."
	@echo

build-modules: $(PHP_MODULES) $(PHP_ZEND_EX)

build-binaries: $(PHP_BINARIES)

libphp.la: $(PHP_GLOBAL_OBJS) $(PHP_SAPI_OBJS)
	$(LIBTOOL) --mode=link $(CC) $(LIBPHP_CFLAGS) $(CFLAGS) $(EXTRA_CFLAGS) -rpath $(phptempdir) $(EXTRA_LDFLAGS) $(LDFLAGS) $(PHP_RPATHS) $(PHP_GLOBAL_OBJS) $(PHP_SAPI_OBJS) $(EXTRA_LIBS) $(ZEND_EXTRA_LIBS) -o $@
	-@$(LIBTOOL) --silent --mode=install cp $@ $(phptempdir)/$@ >/dev/null 2>&1

libs/libphp.bundle: $(PHP_GLOBAL_OBJS) $(PHP_SAPI_OBJS)
	$(CC) $(MH_BUNDLE_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) $(LDFLAGS) $(EXTRA_LDFLAGS) $(PHP_GLOBAL_OBJS:.lo=.o) $(PHP_SAPI_OBJS:.lo=.o) $(PHP_FRAMEWORKS) $(EXTRA_LIBS) $(ZEND_EXTRA_LIBS) -o $@ && cp $@ libs/libphp.so

install: $(all_targets) $(install_targets)

install-sapi: $(OVERALL_TARGET)
	@echo "Installing PHP SAPI module:       $(PHP_SAPI)"
	-@$(mkinstalldirs) $(INSTALL_ROOT)$(bindir)
	-@if test ! -r $(phptempdir)/libphp.$(SHLIB_DL_SUFFIX_NAME); then \
		for i in 0.0.0 0.0 0; do \
			if test -r $(phptempdir)/libphp.$(SHLIB_DL_SUFFIX_NAME).$$i; then \
				$(LN_S) $(phptempdir)/libphp.$(SHLIB_DL_SUFFIX_NAME).$$i $(phptempdir)/libphp.$(SHLIB_DL_SUFFIX_NAME); \
				break; \
			fi; \
		done; \
	fi
	@$(INSTALL_IT)

install-binaries: build-binaries $(install_binary_targets)

install-modules: build-modules
	@test -d modules && \
	$(mkinstalldirs) $(INSTALL_ROOT)$(EXTENSION_DIR)
	@echo "Installing shared extensions:     $(INSTALL_ROOT)$(EXTENSION_DIR)/"
	@rm -f modules/*.la >/dev/null 2>&1
	@$(INSTALL) modules/* $(INSTALL_ROOT)$(EXTENSION_DIR)

install-headers:
	-@if test "$(INSTALL_HEADERS)"; then \
		for i in `echo $(INSTALL_HEADERS)`; do \
			i=`$(top_srcdir)/build/shtool path -d $$i`; \
			paths="$$paths $(INSTALL_ROOT)$(phpincludedir)/$$i"; \
		done; \
		$(mkinstalldirs) $$paths && \
		echo "Installing header files:          $(INSTALL_ROOT)$(phpincludedir)/" && \
		for i in `echo $(INSTALL_HEADERS)`; do \
			if test "$(PHP_PECL_EXTENSION)"; then \
				src=`echo $$i | $(SED) -e "s#ext/$(PHP_PECL_EXTENSION)/##g"`; \
			else \
				src=$$i; \
			fi; \
			if test -f "$(top_srcdir)/$$src"; then \
				$(INSTALL_DATA) $(top_srcdir)/$$src $(INSTALL_ROOT)$(phpincludedir)/$$i; \
			elif test -f "$(top_builddir)/$$src"; then \
				$(INSTALL_DATA) $(top_builddir)/$$src $(INSTALL_ROOT)$(phpincludedir)/$$i; \
			else \
				(cd $(top_srcdir)/$$src && $(INSTALL_DATA) *.h $(INSTALL_ROOT)$(phpincludedir)/$$i; \
				cd $(top_builddir)/$$src && $(INSTALL_DATA) *.h $(INSTALL_ROOT)$(phpincludedir)/$$i) 2>/dev/null || true; \
			fi \
		done; \
	fi

PHP_TEST_SETTINGS = -d 'open_basedir=' -d 'output_buffering=0' -d 'memory_limit=-1'
PHP_TEST_SHARED_EXTENSIONS =  ` \
	if test "x$(PHP_MODULES)" != "x"; then \
		for i in $(PHP_MODULES)""; do \
			. $$i; $(top_srcdir)/build/shtool echo -n -- " -d extension=$$dlname"; \
		done; \
	fi; \
	if test "x$(PHP_ZEND_EX)" != "x"; then \
		for i in $(PHP_ZEND_EX)""; do \
			. $$i; $(top_srcdir)/build/shtool echo -n -- " -d zend_extension=$(top_builddir)/modules/$$dlname"; \
		done; \
	fi`
PHP_DEPRECATED_DIRECTIVES_REGEX = '^(magic_quotes_(gpc|runtime|sybase)?|(zend_)?extension(_debug)?(_ts)?)[\t\ ]*='

test: all
	@if test ! -z "$(PHP_EXECUTABLE)" && test -x "$(PHP_EXECUTABLE)"; then \
		INI_FILE=`$(PHP_EXECUTABLE) -d 'display_errors=stderr' -r 'echo php_ini_loaded_file();' 2> /dev/null`; \
		if test "$$INI_FILE"; then \
			$(EGREP) -h -v $(PHP_DEPRECATED_DIRECTIVES_REGEX) "$$INI_FILE" > $(top_builddir)/tmp-php.ini; \
		else \
			echo > $(top_builddir)/tmp-php.ini; \
		fi; \
		INI_SCANNED_PATH=`$(PHP_EXECUTABLE) -d 'display_errors=stderr' -r '$$a = explode(",\n", trim(php_ini_scanned_files())); echo $$a[0];' 2> /dev/null`; \
		if test "$$INI_SCANNED_PATH"; then \
			INI_SCANNED_PATH=`$(top_srcdir)/build/shtool path -d $$INI_SCANNED_PATH`; \
			$(EGREP) -h -v $(PHP_DEPRECATED_DIRECTIVES_REGEX) "$$INI_SCANNED_PATH"/*.ini >> $(top_builddir)/tmp-php.ini; \
		fi; \
		TEST_PHP_EXECUTABLE=$(PHP_EXECUTABLE) \
		TEST_PHP_SRCDIR=$(top_srcdir) \
		CC="$(CC)" \
			$(PHP_EXECUTABLE) -n -c $(top_builddir)/tmp-php.ini $(PHP_TEST_SETTINGS) $(top_srcdir)/run-tests.php -n -c $(top_builddir)/tmp-php.ini -d extension_dir=$(top_builddir)/modules/ $(PHP_TEST_SHARED_EXTENSIONS) $(TESTS); \
		TEST_RESULT_EXIT_CODE=$$?; \
		rm $(top_builddir)/tmp-php.ini; \
		exit $$TEST_RESULT_EXIT_CODE; \
	else \
		echo "ERROR: Cannot run tests without CLI sapi."; \
	fi

clean:
	find . -name \*.gcno -o -name \*.gcda | xargs rm -f
	find . -name \*.lo -o -name \*.o | xargs rm -f
	find . -name \*.la -o -name \*.a | xargs rm -f
	find . -name \*.so | xargs rm -f
	find . -name .libs -a -type d|xargs rm -rf
	rm -f libphp.la $(SAPI_CLI_PATH) $(SAPI_CGI_PATH) $(SAPI_LITESPEED_PATH) $(SAPI_FPM_PATH) $(OVERALL_TARGET) modules/* libs/*

distclean: clean
	rm -f Makefile config.cache config.log config.status Makefile.objects Makefile.fragments libtool main/php_config.h main/internal_functions_cli.c main/internal_functions.c Zend/zend_dtrace_gen.h Zend/zend_dtrace_gen.h.bak Zend/zend_config.h
	rm -f main/build-defs.h scripts/phpize
	rm -f ext/date/lib/timelib_config.h ext/mbstring/libmbfl/config.h ext/oci8/oci8_dtrace_gen.h ext/oci8/oci8_dtrace_gen.h.bak
	rm -f scripts/man1/phpize.1 scripts/php-config scripts/man1/php-config.1 sapi/cli/php.1 sapi/cgi/php-cgi.1 sapi/phpdbg/phpdbg.1 ext/phar/phar.1 ext/phar/phar.phar.1
	rm -f sapi/fpm/php-fpm.conf sapi/fpm/init.d.php-fpm sapi/fpm/php-fpm.service sapi/fpm/php-fpm.8 sapi/fpm/status.html
	rm -f ext/phar/phar.phar ext/phar/phar.php
	rm -f ext/opcache/jit/zend_jit_x86.c
	if test "$(srcdir)" != "$(builddir)"; then \
	  rm -f ext/phar/phar/phar.inc; \
	fi
	$(EGREP) define'.*include/php' $(top_srcdir)/configure | $(SED) 's/.*>//'|xargs rm -f

prof-gen:
	CCACHE_DISABLE=1 $(MAKE) PROF_FLAGS=-fprofile-generate all

prof-clean:
	find . -name \*.lo -o -name \*.o | xargs rm -f
	find . -name \*.la -o -name \*.a | xargs rm -f
	find . -name \*.so | xargs rm -f
	rm -f libphp.la $(SAPI_CLI_PATH) $(SAPI_CGI_PATH) $(SAPI_LITESPEED_PATH) $(SAPI_FPM_PATH) $(OVERALL_TARGET) modules/* libs/*

prof-use:
	CCACHE_DISABLE=1 $(MAKE) PROF_FLAGS=-fprofile-use all

# only php above 7.1.0 supports nullable return type
%_arginfo.h: %.stub.php
	@if test -e "$(top_srcdir)/build/gen_stub.php"; then \
		if test ! -z "$(PHP_EXECUTABLE)" && test -x "$(PHP_EXECUTABLE)"; then \
			echo Parse $< to generate $@;\
			$(PHP_EXECUTABLE) $(top_srcdir)/build/gen_stub.php $<; \
		elif type php >/dev/null 2>/dev/null; then \
			if test `php -v | head -n1 | cut -d" " -f 2 | sed "s/$$/\n7.0.99/" | sort -rV | head -n1` != "7.0.99"; then \
				echo Parse $< to generate $@;\
				php $(top_srcdir)/build/gen_stub.php $<; \
			fi; \
		fi; \
	fi;

# As we don't track includes, this is just a heuristic
%.c: %_arginfo.h
	@touch $@

.PHONY: all clean install distclean test prof-gen prof-clean prof-use
.NOEXPORT:
cli: $(SAPI_CLI_PATH)

$(SAPI_CLI_PATH): $(PHP_GLOBAL_OBJS) $(PHP_BINARY_OBJS) $(PHP_CLI_OBJS)
	$(BUILD_CLI)

install-cli: $(SAPI_CLI_PATH)
	@echo "Installing PHP CLI binary:        $(INSTALL_ROOT)$(bindir)/"
	@$(mkinstalldirs) $(INSTALL_ROOT)$(bindir)
	@$(INSTALL) -m 0755 $(SAPI_CLI_PATH) $(INSTALL_ROOT)$(bindir)/$(program_prefix)php$(program_suffix)$(EXEEXT)
	@echo "Installing PHP CLI man page:      $(INSTALL_ROOT)$(mandir)/man1/"
	@$(mkinstalldirs) $(INSTALL_ROOT)$(mandir)/man1
	@$(INSTALL_DATA) sapi/cli/php.1 $(INSTALL_ROOT)$(mandir)/man1/$(program_prefix)php$(program_suffix).1
phpdbg: $(BUILD_BINARY)

phpdbg-shared: $(BUILD_SHARED)

$(BUILD_SHARED): $(PHP_GLOBAL_OBJS) $(PHP_BINARY_OBJS) $(PHP_PHPDBG_OBJS)
	$(BUILD_PHPDBG_SHARED)

$(BUILD_BINARY): $(PHP_GLOBAL_OBJS) $(PHP_BINARY_OBJS) $(PHP_PHPDBG_OBJS)
	$(BUILD_PHPDBG)

%.c: %.y
%.c: %.l

/home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_lexer.lo: /home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_parser.h

/home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_lexer.c: /home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_lexer.l
	@(cd $(top_srcdir); $(RE2C) $(RE2C_FLAGS) --no-generation-date -cbdFo sapi/phpdbg/phpdbg_lexer.c sapi/phpdbg/phpdbg_lexer.l)

/home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_parser.h: /home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_parser.c
/home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_parser.c: /home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_parser.y
	@$(YACC) $(YFLAGS) -v -d /home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_parser.y -o $@

install-phpdbg: $(BUILD_BINARY)
	@echo "Installing phpdbg binary:         $(INSTALL_ROOT)$(bindir)/"
	@$(mkinstalldirs) $(INSTALL_ROOT)$(bindir)
	@$(mkinstalldirs) $(INSTALL_ROOT)$(localstatedir)/log
	@$(mkinstalldirs) $(INSTALL_ROOT)$(localstatedir)/run
	@$(INSTALL) -m 0755 $(BUILD_BINARY) $(INSTALL_ROOT)$(bindir)/$(program_prefix)phpdbg$(program_suffix)$(EXEEXT)
	@echo "Installing phpdbg man page:       $(INSTALL_ROOT)$(mandir)/man1/"
	@$(mkinstalldirs) $(INSTALL_ROOT)$(mandir)/man1
	@$(INSTALL_DATA) sapi/phpdbg/phpdbg.1 $(INSTALL_ROOT)$(mandir)/man1/$(program_prefix)phpdbg$(program_suffix).1

clean-phpdbg:
	@echo "Cleaning phpdbg object files ..."
	find sapi/phpdbg/ -name *.lo -o -name *.o | xargs rm -f

test-phpdbg:
	@echo "Running phpdbg tests ..."
	@$(top_builddir)/sapi/cli/php sapi/phpdbg/tests/run-tests.php --phpdbg sapi/phpdbg/phpdbg

.PHONY: clean-phpdbg test-phpdbg
cgi: $(SAPI_CGI_PATH)

$(SAPI_CGI_PATH): $(PHP_GLOBAL_OBJS) $(PHP_BINARY_OBJS) $(PHP_FASTCGI_OBJS) $(PHP_CGI_OBJS)
	$(BUILD_CGI)

install-cgi: $(SAPI_CGI_PATH)
	@echo "Installing PHP CGI binary:        $(INSTALL_ROOT)$(bindir)/"
	@$(mkinstalldirs) $(INSTALL_ROOT)$(bindir)
	@$(INSTALL) -m 0755 $(SAPI_CGI_PATH) $(INSTALL_ROOT)$(bindir)/$(program_prefix)php-cgi$(program_suffix)$(EXEEXT)
	@echo "Installing PHP CGI man page:      $(INSTALL_ROOT)$(mandir)/man1/"
	@$(mkinstalldirs) $(INSTALL_ROOT)$(mandir)/man1
	@$(INSTALL_DATA) sapi/cgi/php-cgi.1 $(INSTALL_ROOT)$(mandir)/man1/$(program_prefix)php-cgi$(program_suffix).1
ext/fileinfo/libmagic/apprentice.lo: /home/$USER/software/sources/php/php-src/ext/fileinfo/data_file.c
/home/$USER/software/sources/php/php-src/ext/json/json_scanner.c: /home/$USER/software/sources/php/php-src/ext/json/json_scanner.re
	@$(RE2C) $(RE2C_FLAGS) -t /home/$USER/software/sources/php/php-src/ext/json/php_json_scanner_defs.h --no-generation-date -bci -o $@ /home/$USER/software/sources/php/php-src/ext/json/json_scanner.re

/home/$USER/software/sources/php/php-src/ext/json/json_parser.tab.c: /home/$USER/software/sources/php/php-src/ext/json/json_parser.y
	@$(YACC) $(YFLAGS) --defines -l /home/$USER/software/sources/php/php-src/ext/json/json_parser.y -o $@

ext/opcache/minilua: /home/$USER/software/sources/php/php-src/ext/opcache/jit/dynasm/minilua.c
	$(CC) /home/$USER/software/sources/php/php-src/ext/opcache/jit/dynasm/minilua.c -lm -o $@

ext/opcache/jit/zend_jit_x86.c: /home/$USER/software/sources/php/php-src/ext/opcache/jit/zend_jit_x86.dasc /home/$USER/software/sources/php/php-src/ext/opcache/jit/dynasm/*.lua ext/opcache/minilua
	ext/opcache/minilua /home/$USER/software/sources/php/php-src/ext/opcache/jit/dynasm/dynasm.lua  $(DASM_FLAGS) -o $@ /home/$USER/software/sources/php/php-src/ext/opcache/jit/zend_jit_x86.dasc

ext/opcache/jit/zend_jit.lo: \
	ext/opcache/jit/zend_jit_x86.c \
	/home/$USER/software/sources/php/php-src/ext/opcache/jit/zend_jit_helpers.c \
	/home/$USER/software/sources/php/php-src/ext/opcache/jit/zend_jit_disasm_x86.c \
	/home/$USER/software/sources/php/php-src/ext/opcache/jit/zend_jit_gdb.c \
	/home/$USER/software/sources/php/php-src/ext/opcache/jit/zend_jit_perf_dump.c \
	/home/$USER/software/sources/php/php-src/ext/opcache/jit/zend_jit_oprofile.c \
	/home/$USER/software/sources/php/php-src/ext/opcache/jit/zend_jit_vtune.c \
	/home/$USER/software/sources/php/php-src/ext/opcache/jit/zend_jit_trace.c \
	/home/$USER/software/sources/php/php-src/ext/opcache/jit/zend_elf.c

phpincludedir=$(prefix)/include/php

PDO_HEADER_FILES= \
	php_pdo.h \
	php_pdo_driver.h \
	php_pdo_error.h


/home/$USER/software/sources/php/php-src/ext/pdo/pdo_sql_parser.c: /home/$USER/software/sources/php/php-src/ext/pdo/pdo_sql_parser.re
	@(cd $(top_srcdir); \
	if test -f ./pdo_sql_parser.re; then \
		$(RE2C) $(RE2C_FLAGS) --no-generation-date -o pdo_sql_parser.c pdo_sql_parser.re; \
	else \
		$(RE2C) $(RE2C_FLAGS) --no-generation-date -o ext/pdo/pdo_sql_parser.c ext/pdo/pdo_sql_parser.re; \
	fi)

install-pdo-headers:
	@echo "Installing PDO headers:           $(INSTALL_ROOT)$(phpincludedir)/ext/pdo/"
	@$(mkinstalldirs) $(INSTALL_ROOT)$(phpincludedir)/ext/pdo
	@for f in $(PDO_HEADER_FILES); do \
		if test -f "$(top_srcdir)/$$f"; then \
			$(INSTALL_DATA) $(top_srcdir)/$$f $(INSTALL_ROOT)$(phpincludedir)/ext/pdo; \
		elif test -f "$(top_builddir)/$$f"; then \
			$(INSTALL_DATA) $(top_builddir)/$$f $(INSTALL_ROOT)$(phpincludedir)/ext/pdo; \
		elif test -f "$(top_srcdir)/ext/pdo/$$f"; then \
			$(INSTALL_DATA) $(top_srcdir)/ext/pdo/$$f $(INSTALL_ROOT)$(phpincludedir)/ext/pdo; \
		elif test -f "$(top_builddir)/ext/pdo/$$f"; then \
			$(INSTALL_DATA) $(top_builddir)/ext/pdo/$$f $(INSTALL_ROOT)$(phpincludedir)/ext/pdo; \
		else \
			echo "hmmm"; \
		fi \
	done;

# mini hack
install: $(all_targets) $(install_targets) install-pdo-headers
/home/$USER/software/sources/php/php-src/ext/phar/phar_path_check.c: /home/$USER/software/sources/php/php-src/ext/phar/phar_path_check.re
	@(cd $(top_srcdir); \
	if test -f ./php_phar.h; then \
		$(RE2C) $(RE2C_FLAGS) --no-generation-date -b -o phar_path_check.c phar_path_check.re; \
	else \
		$(RE2C) $(RE2C_FLAGS) --no-generation-date -b -o ext/phar/phar_path_check.c ext/phar/phar_path_check.re; \
	fi)

pharcmd: ext/phar/phar.php ext/phar/phar.phar

PHP_PHARCMD_SETTINGS = -n -d 'open_basedir=' -d 'output_buffering=0' -d 'memory_limit=-1' -d phar.readonly=0
PHP_PHARCMD_EXECUTABLE = ` \
	if test -x "$(top_builddir)/$(SAPI_CLI_PATH)"; then \
		$(top_srcdir)/build/shtool echo -n -- "$(top_builddir)/$(SAPI_CLI_PATH) -n"; \
		if test "x$(PHP_MODULES)" != "x"; then \
		$(top_srcdir)/build/shtool echo -n -- " -d extension_dir=$(top_builddir)/modules"; \
		for i in bz2 zlib phar; do \
			if test -f "$(top_builddir)/modules/$$i.la"; then \
				. $(top_builddir)/modules/$$i.la; $(top_srcdir)/build/shtool echo -n -- " -d extension=$$dlname"; \
			fi; \
		done; \
		fi; \
	else \
		$(top_srcdir)/build/shtool echo -n -- "$(PHP_EXECUTABLE)"; \
	fi;`
PHP_PHARCMD_BANG = `$(top_srcdir)/build/shtool echo -n -- "$(INSTALL_ROOT)$(bindir)/$(program_prefix)php$(program_suffix)$(EXEEXT)";`

ext/phar/phar/phar.inc: /home/$USER/software/sources/php/php-src/ext/phar/phar/phar.inc
	-@test -d ext/phar/phar || mkdir ext/phar/phar
	-@test -f ext/phar/phar/phar.inc || cp /home/$USER/software/sources/php/php-src/ext/phar/phar/phar.inc ext/phar/phar/phar.inc

ext/phar/phar.php: /home/$USER/software/sources/php/php-src/ext/phar/build_precommand.php /home/$USER/software/sources/php/php-src/ext/phar/phar/*.inc /home/$USER/software/sources/php/php-src/ext/phar/phar/*.php $(SAPI_CLI_PATH)
	-@echo "Generating phar.php"
	@$(PHP_PHARCMD_EXECUTABLE) $(PHP_PHARCMD_SETTINGS) /home/$USER/software/sources/php/php-src/ext/phar/build_precommand.php > ext/phar/phar.php

ext/phar/phar.phar: ext/phar/phar.php ext/phar/phar/phar.inc /home/$USER/software/sources/php/php-src/ext/phar/phar/*.inc /home/$USER/software/sources/php/php-src/ext/phar/phar/*.php $(SAPI_CLI_PATH)
	-@echo "Generating phar.phar"
	-@rm -f ext/phar/phar.phar
	-@rm -f /home/$USER/software/sources/php/php-src/ext/phar/phar.phar
	@$(PHP_PHARCMD_EXECUTABLE) $(PHP_PHARCMD_SETTINGS) ext/phar/phar.php pack -f ext/phar/phar.phar -a pharcommand -c auto -x \\.svn -p 0 -s /home/$USER/software/sources/php/php-src/ext/phar/phar/phar.php -h sha1 -b "$(PHP_PHARCMD_BANG)"  /home/$USER/software/sources/php/php-src/ext/phar/phar/
	-@chmod +x ext/phar/phar.phar

install-pharcmd: pharcmd
	-@$(mkinstalldirs) $(INSTALL_ROOT)$(bindir)
	$(INSTALL) ext/phar/phar.phar $(INSTALL_ROOT)$(bindir)/$(program_prefix)phar$(program_suffix).phar
	-@rm -f $(INSTALL_ROOT)$(bindir)/$(program_prefix)phar$(program_suffix)
	$(LN_S) -f $(program_prefix)phar$(program_suffix).phar $(INSTALL_ROOT)$(bindir)/$(program_prefix)phar$(program_suffix)
	@$(mkinstalldirs) $(INSTALL_ROOT)$(mandir)/man1
	@$(INSTALL_DATA) ext/phar/phar.1 $(INSTALL_ROOT)$(mandir)/man1/$(program_prefix)phar$(program_suffix).1
	@$(INSTALL_DATA) ext/phar/phar.phar.1 $(INSTALL_ROOT)$(mandir)/man1/$(program_prefix)phar$(program_suffix).phar.1
/home/$USER/software/sources/php/php-src/ext/standard/var_unserializer.c: /home/$USER/software/sources/php/php-src/ext/standard/var_unserializer.re
	@(cd $(top_srcdir); $(RE2C) $(RE2C_FLAGS) --no-generation-date -b -o ext/standard/var_unserializer.c ext/standard/var_unserializer.re)

/home/$USER/software/sources/php/php-src/ext/standard/url_scanner_ex.c: /home/$USER/software/sources/php/php-src/ext/standard/url_scanner_ex.re
	@(cd $(top_srcdir); $(RE2C) $(RE2C_FLAGS) --no-generation-date -b -o ext/standard/url_scanner_ex.c	ext/standard/url_scanner_ex.re)

ext/standard/info.lo: ext/standard/../../main/build-defs.h

ext/standard/basic_functions.lo: $(top_srcdir)/Zend/zend_language_parser.h
$(top_srcdir)/Zend/zend_language_parser.c:
$(top_srcdir)/Zend/zend_language_scanner.c:
$(top_srcdir)/ext/tokenizer/tokenizer_data.c: $(top_srcdir)/Zend/zend_language_parser.h
ext/tokenizer/tokenizer.lo: $(top_srcdir)/Zend/zend_language_parser.c $(top_srcdir)/Zend/zend_language_scanner.c
#
# Build environment install
#

phpincludedir = $(includedir)/php
phpbuilddir = $(libdir)/build

BUILD_FILES = \
	scripts/phpize.m4 \
	build/libtool.m4 \
	build/ltmain.sh \
	build/ax_check_compile_flag.m4 \
	build/ax_gcc_func_attribute.m4 \
	build/php_cxx_compile_stdcxx.m4 \
	build/pkg.m4 \
	build/Makefile.global \
	build/php.m4 \
	build/gen_stub.php \
	run-tests.php

BUILD_FILES_EXEC = \
	build/shtool \
	build/config.guess \
	build/config.sub

bin_SCRIPTS = phpize php-config
man_PAGES = phpize php-config

install-build:
	@echo "Installing build environment:     $(INSTALL_ROOT)$(phpbuilddir)/"
	@$(mkinstalldirs) $(INSTALL_ROOT)$(phpbuilddir) $(INSTALL_ROOT)$(bindir) && \
	(cd $(top_srcdir) && \
	$(INSTALL) $(BUILD_FILES_EXEC) $(INSTALL_ROOT)$(phpbuilddir) && \
	$(INSTALL_DATA) $(BUILD_FILES) $(INSTALL_ROOT)$(phpbuilddir))

install-programs: scripts/phpize scripts/php-config
	@echo "Installing helper programs:       $(INSTALL_ROOT)$(bindir)/"
	@$(mkinstalldirs) $(INSTALL_ROOT)$(bindir)
	@for prog in $(bin_SCRIPTS); do \
		echo "  program: $(program_prefix)$${prog}$(program_suffix)"; \
		$(INSTALL) -m 755 scripts/$${prog} $(INSTALL_ROOT)$(bindir)/$(program_prefix)$${prog}$(program_suffix); \
	done
	@echo "Installing man pages:             $(INSTALL_ROOT)$(mandir)/man1/"
	@$(mkinstalldirs) $(INSTALL_ROOT)$(mandir)/man1
	@for page in $(man_PAGES); do \
		echo "  page: $(program_prefix)$${page}$(program_suffix).1"; \
		$(INSTALL_DATA) scripts/man1/$${page}.1 $(INSTALL_ROOT)$(mandir)/man1/$(program_prefix)$${page}$(program_suffix).1; \
	done

scripts/phpize: /home/$USER/software/sources/php/php-src/scripts/phpize.in $(top_builddir)/config.status
	(CONFIG_FILES=$@ CONFIG_HEADERS= $(top_builddir)/config.status)

scripts/php-config: /home/$USER/software/sources/php/php-src/scripts/php-config.in $(top_builddir)/config.status
	(CONFIG_FILES=$@ CONFIG_HEADERS= $(top_builddir)/config.status)
#
# Zend
#

Zend/zend_language_scanner.lo: /home/$USER/software/sources/php/php-src/Zend/zend_language_parser.h
Zend/zend_ini_scanner.lo: /home/$USER/software/sources/php/php-src/Zend/zend_ini_parser.h

/home/$USER/software/sources/php/php-src/Zend/zend_language_scanner.c: /home/$USER/software/sources/php/php-src/Zend/zend_language_scanner.l
	@(cd $(top_srcdir); $(RE2C) $(RE2C_FLAGS) --no-generation-date --case-inverted -cbdFt Zend/zend_language_scanner_defs.h -oZend/zend_language_scanner.c Zend/zend_language_scanner.l)

/home/$USER/software/sources/php/php-src/Zend/zend_language_parser.h: /home/$USER/software/sources/php/php-src/Zend/zend_language_parser.c
/home/$USER/software/sources/php/php-src/Zend/zend_language_parser.c: /home/$USER/software/sources/php/php-src/Zend/zend_language_parser.y
# Tweak zendparse to be exported through ZEND_API. This has to be revisited once
# bison supports foreign skeletons and that bison version is used. Read
# https://git.savannah.gnu.org/cgit/bison.git/tree/data/README.md for more.
	@$(YACC) $(YFLAGS) -v -d /home/$USER/software/sources/php/php-src/Zend/zend_language_parser.y -o $@
	@$(SED) -e 's,^int zendparse\(.*\),ZEND_API int zendparse\1,g' < $@ \
	> $@.tmp && \
	mv $@.tmp $@
	@$(SED) -e 's,^int zendparse\(.*\),ZEND_API int zendparse\1,g' < /home/$USER/software/sources/php/php-src/Zend/zend_language_parser.h \
	> /home/$USER/software/sources/php/php-src/Zend/zend_language_parser.h.tmp && \
	mv /home/$USER/software/sources/php/php-src/Zend/zend_language_parser.h.tmp /home/$USER/software/sources/php/php-src/Zend/zend_language_parser.h
	@nlinit=`echo 'nl="'; echo '"'`; eval "$$nlinit"; \
	$(SED) -e "s/^#ifndef YYTOKENTYPE/#include \"zend.h\"\\$${nl}#ifndef YYTOKENTYPE/" < /home/$USER/software/sources/php/php-src/Zend/zend_language_parser.h \
	> /home/$USER/software/sources/php/php-src/Zend/zend_language_parser.h.tmp && \
	mv /home/$USER/software/sources/php/php-src/Zend/zend_language_parser.h.tmp /home/$USER/software/sources/php/php-src/Zend/zend_language_parser.h

/home/$USER/software/sources/php/php-src/Zend/zend_ini_parser.h: /home/$USER/software/sources/php/php-src/Zend/zend_ini_parser.c
/home/$USER/software/sources/php/php-src/Zend/zend_ini_parser.c: /home/$USER/software/sources/php/php-src/Zend/zend_ini_parser.y
	$(YACC) $(YFLAGS) -v -d /home/$USER/software/sources/php/php-src/Zend/zend_ini_parser.y -o $@

/home/$USER/software/sources/php/php-src/Zend/zend_ini_scanner.c: /home/$USER/software/sources/php/php-src/Zend/zend_ini_scanner.l
	@(cd $(top_srcdir); $(RE2C) $(RE2C_FLAGS) --no-generation-date --case-inverted -cbdFt Zend/zend_ini_scanner_defs.h -oZend/zend_ini_scanner.c Zend/zend_ini_scanner.l)

Zend/zend_highlight.lo Zend/zend_compile.lo: /home/$USER/software/sources/php/php-src/Zend/zend_language_parser.h

Zend/zend_execute.lo: /home/$USER/software/sources/php/php-src/Zend/zend_vm_execute.h /home/$USER/software/sources/php/php-src/Zend/zend_vm_opcodes.h
sapi/cli/php_cli.lo: /home/$USER/software/sources/php/php-src/sapi/cli/php_cli.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Isapi/cli/ -I/home/$USER/software/sources/php/php-src/sapi/cli/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/sapi/cli/php_cli.c -o sapi/cli/php_cli.lo 
sapi/cli/php_http_parser.lo: /home/$USER/software/sources/php/php-src/sapi/cli/php_http_parser.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Isapi/cli/ -I/home/$USER/software/sources/php/php-src/sapi/cli/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/sapi/cli/php_http_parser.c -o sapi/cli/php_http_parser.lo 
sapi/cli/php_cli_server.lo: /home/$USER/software/sources/php/php-src/sapi/cli/php_cli_server.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Isapi/cli/ -I/home/$USER/software/sources/php/php-src/sapi/cli/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/sapi/cli/php_cli_server.c -o sapi/cli/php_cli_server.lo 
sapi/cli/ps_title.lo: /home/$USER/software/sources/php/php-src/sapi/cli/ps_title.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Isapi/cli/ -I/home/$USER/software/sources/php/php-src/sapi/cli/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/sapi/cli/ps_title.c -o sapi/cli/ps_title.lo 
sapi/cli/php_cli_process_title.lo: /home/$USER/software/sources/php/php-src/sapi/cli/php_cli_process_title.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Isapi/cli/ -I/home/$USER/software/sources/php/php-src/sapi/cli/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/sapi/cli/php_cli_process_title.c -o sapi/cli/php_cli_process_title.lo 
sapi/phpdbg/phpdbg.lo: /home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg.c
	$(LIBTOOL) --mode=compile $(CC) -D_GNU_SOURCE -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Isapi/phpdbg/ -I/home/$USER/software/sources/php/php-src/sapi/phpdbg/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg.c -o sapi/phpdbg/phpdbg.lo 
sapi/phpdbg/phpdbg_parser.lo: /home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_parser.c
	$(LIBTOOL) --mode=compile $(CC) -D_GNU_SOURCE -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Isapi/phpdbg/ -I/home/$USER/software/sources/php/php-src/sapi/phpdbg/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_parser.c -o sapi/phpdbg/phpdbg_parser.lo 
sapi/phpdbg/phpdbg_lexer.lo: /home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_lexer.c
	$(LIBTOOL) --mode=compile $(CC) -D_GNU_SOURCE -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Isapi/phpdbg/ -I/home/$USER/software/sources/php/php-src/sapi/phpdbg/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_lexer.c -o sapi/phpdbg/phpdbg_lexer.lo 
sapi/phpdbg/phpdbg_prompt.lo: /home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_prompt.c
	$(LIBTOOL) --mode=compile $(CC) -D_GNU_SOURCE -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Isapi/phpdbg/ -I/home/$USER/software/sources/php/php-src/sapi/phpdbg/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_prompt.c -o sapi/phpdbg/phpdbg_prompt.lo 
sapi/phpdbg/phpdbg_help.lo: /home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_help.c
	$(LIBTOOL) --mode=compile $(CC) -D_GNU_SOURCE -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Isapi/phpdbg/ -I/home/$USER/software/sources/php/php-src/sapi/phpdbg/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_help.c -o sapi/phpdbg/phpdbg_help.lo 
sapi/phpdbg/phpdbg_break.lo: /home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_break.c
	$(LIBTOOL) --mode=compile $(CC) -D_GNU_SOURCE -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Isapi/phpdbg/ -I/home/$USER/software/sources/php/php-src/sapi/phpdbg/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_break.c -o sapi/phpdbg/phpdbg_break.lo 
sapi/phpdbg/phpdbg_print.lo: /home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_print.c
	$(LIBTOOL) --mode=compile $(CC) -D_GNU_SOURCE -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Isapi/phpdbg/ -I/home/$USER/software/sources/php/php-src/sapi/phpdbg/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_print.c -o sapi/phpdbg/phpdbg_print.lo 
sapi/phpdbg/phpdbg_bp.lo: /home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_bp.c
	$(LIBTOOL) --mode=compile $(CC) -D_GNU_SOURCE -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Isapi/phpdbg/ -I/home/$USER/software/sources/php/php-src/sapi/phpdbg/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_bp.c -o sapi/phpdbg/phpdbg_bp.lo 
sapi/phpdbg/phpdbg_opcode.lo: /home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_opcode.c
	$(LIBTOOL) --mode=compile $(CC) -D_GNU_SOURCE -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Isapi/phpdbg/ -I/home/$USER/software/sources/php/php-src/sapi/phpdbg/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_opcode.c -o sapi/phpdbg/phpdbg_opcode.lo 
sapi/phpdbg/phpdbg_list.lo: /home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_list.c
	$(LIBTOOL) --mode=compile $(CC) -D_GNU_SOURCE -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Isapi/phpdbg/ -I/home/$USER/software/sources/php/php-src/sapi/phpdbg/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_list.c -o sapi/phpdbg/phpdbg_list.lo 
sapi/phpdbg/phpdbg_utils.lo: /home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_utils.c
	$(LIBTOOL) --mode=compile $(CC) -D_GNU_SOURCE -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Isapi/phpdbg/ -I/home/$USER/software/sources/php/php-src/sapi/phpdbg/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_utils.c -o sapi/phpdbg/phpdbg_utils.lo 
sapi/phpdbg/phpdbg_info.lo: /home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_info.c
	$(LIBTOOL) --mode=compile $(CC) -D_GNU_SOURCE -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Isapi/phpdbg/ -I/home/$USER/software/sources/php/php-src/sapi/phpdbg/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_info.c -o sapi/phpdbg/phpdbg_info.lo 
sapi/phpdbg/phpdbg_cmd.lo: /home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_cmd.c
	$(LIBTOOL) --mode=compile $(CC) -D_GNU_SOURCE -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Isapi/phpdbg/ -I/home/$USER/software/sources/php/php-src/sapi/phpdbg/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_cmd.c -o sapi/phpdbg/phpdbg_cmd.lo 
sapi/phpdbg/phpdbg_set.lo: /home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_set.c
	$(LIBTOOL) --mode=compile $(CC) -D_GNU_SOURCE -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Isapi/phpdbg/ -I/home/$USER/software/sources/php/php-src/sapi/phpdbg/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_set.c -o sapi/phpdbg/phpdbg_set.lo 
sapi/phpdbg/phpdbg_frame.lo: /home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_frame.c
	$(LIBTOOL) --mode=compile $(CC) -D_GNU_SOURCE -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Isapi/phpdbg/ -I/home/$USER/software/sources/php/php-src/sapi/phpdbg/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_frame.c -o sapi/phpdbg/phpdbg_frame.lo 
sapi/phpdbg/phpdbg_watch.lo: /home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_watch.c
	$(LIBTOOL) --mode=compile $(CC) -D_GNU_SOURCE -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Isapi/phpdbg/ -I/home/$USER/software/sources/php/php-src/sapi/phpdbg/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_watch.c -o sapi/phpdbg/phpdbg_watch.lo 
sapi/phpdbg/phpdbg_btree.lo: /home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_btree.c
	$(LIBTOOL) --mode=compile $(CC) -D_GNU_SOURCE -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Isapi/phpdbg/ -I/home/$USER/software/sources/php/php-src/sapi/phpdbg/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_btree.c -o sapi/phpdbg/phpdbg_btree.lo 
sapi/phpdbg/phpdbg_sigsafe.lo: /home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_sigsafe.c
	$(LIBTOOL) --mode=compile $(CC) -D_GNU_SOURCE -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Isapi/phpdbg/ -I/home/$USER/software/sources/php/php-src/sapi/phpdbg/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_sigsafe.c -o sapi/phpdbg/phpdbg_sigsafe.lo 
sapi/phpdbg/phpdbg_wait.lo: /home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_wait.c
	$(LIBTOOL) --mode=compile $(CC) -D_GNU_SOURCE -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Isapi/phpdbg/ -I/home/$USER/software/sources/php/php-src/sapi/phpdbg/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_wait.c -o sapi/phpdbg/phpdbg_wait.lo 
sapi/phpdbg/phpdbg_io.lo: /home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_io.c
	$(LIBTOOL) --mode=compile $(CC) -D_GNU_SOURCE -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Isapi/phpdbg/ -I/home/$USER/software/sources/php/php-src/sapi/phpdbg/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_io.c -o sapi/phpdbg/phpdbg_io.lo 
sapi/phpdbg/phpdbg_eol.lo: /home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_eol.c
	$(LIBTOOL) --mode=compile $(CC) -D_GNU_SOURCE -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Isapi/phpdbg/ -I/home/$USER/software/sources/php/php-src/sapi/phpdbg/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_eol.c -o sapi/phpdbg/phpdbg_eol.lo 
sapi/phpdbg/phpdbg_out.lo: /home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_out.c
	$(LIBTOOL) --mode=compile $(CC) -D_GNU_SOURCE -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Isapi/phpdbg/ -I/home/$USER/software/sources/php/php-src/sapi/phpdbg/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/sapi/phpdbg/phpdbg_out.c -o sapi/phpdbg/phpdbg_out.lo 
sapi/cgi/cgi_main.lo: /home/$USER/software/sources/php/php-src/sapi/cgi/cgi_main.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Isapi/cgi/ -I/home/$USER/software/sources/php/php-src/sapi/cgi/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/sapi/cgi/cgi_main.c -o sapi/cgi/cgi_main.lo 
ext/date/php_date.lo: /home/$USER/software/sources/php/php-src/ext/date/php_date.c
	$(LIBTOOL) --mode=compile $(CC) -Iext/date/lib -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -DHAVE_TIMELIB_CONFIG_H=1 -Iext/date/ -I/home/$USER/software/sources/php/php-src/ext/date/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/date/php_date.c -o ext/date/php_date.lo 
ext/date/lib/astro.lo: /home/$USER/software/sources/php/php-src/ext/date/lib/astro.c
	$(LIBTOOL) --mode=compile $(CC) -Iext/date/lib -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -DHAVE_TIMELIB_CONFIG_H=1 -Iext/date/ -I/home/$USER/software/sources/php/php-src/ext/date/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/date/lib/astro.c -o ext/date/lib/astro.lo 
ext/date/lib/dow.lo: /home/$USER/software/sources/php/php-src/ext/date/lib/dow.c
	$(LIBTOOL) --mode=compile $(CC) -Iext/date/lib -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -DHAVE_TIMELIB_CONFIG_H=1 -Iext/date/ -I/home/$USER/software/sources/php/php-src/ext/date/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/date/lib/dow.c -o ext/date/lib/dow.lo 
ext/date/lib/parse_date.lo: /home/$USER/software/sources/php/php-src/ext/date/lib/parse_date.c
	$(LIBTOOL) --mode=compile $(CC) -Iext/date/lib -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -DHAVE_TIMELIB_CONFIG_H=1 -Iext/date/ -I/home/$USER/software/sources/php/php-src/ext/date/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/date/lib/parse_date.c -o ext/date/lib/parse_date.lo 
ext/date/lib/parse_tz.lo: /home/$USER/software/sources/php/php-src/ext/date/lib/parse_tz.c
	$(LIBTOOL) --mode=compile $(CC) -Iext/date/lib -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -DHAVE_TIMELIB_CONFIG_H=1 -Iext/date/ -I/home/$USER/software/sources/php/php-src/ext/date/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/date/lib/parse_tz.c -o ext/date/lib/parse_tz.lo 
ext/date/lib/timelib.lo: /home/$USER/software/sources/php/php-src/ext/date/lib/timelib.c
	$(LIBTOOL) --mode=compile $(CC) -Iext/date/lib -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -DHAVE_TIMELIB_CONFIG_H=1 -Iext/date/ -I/home/$USER/software/sources/php/php-src/ext/date/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/date/lib/timelib.c -o ext/date/lib/timelib.lo 
ext/date/lib/tm2unixtime.lo: /home/$USER/software/sources/php/php-src/ext/date/lib/tm2unixtime.c
	$(LIBTOOL) --mode=compile $(CC) -Iext/date/lib -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -DHAVE_TIMELIB_CONFIG_H=1 -Iext/date/ -I/home/$USER/software/sources/php/php-src/ext/date/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/date/lib/tm2unixtime.c -o ext/date/lib/tm2unixtime.lo 
ext/date/lib/unixtime2tm.lo: /home/$USER/software/sources/php/php-src/ext/date/lib/unixtime2tm.c
	$(LIBTOOL) --mode=compile $(CC) -Iext/date/lib -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -DHAVE_TIMELIB_CONFIG_H=1 -Iext/date/ -I/home/$USER/software/sources/php/php-src/ext/date/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/date/lib/unixtime2tm.c -o ext/date/lib/unixtime2tm.lo 
ext/date/lib/parse_iso_intervals.lo: /home/$USER/software/sources/php/php-src/ext/date/lib/parse_iso_intervals.c
	$(LIBTOOL) --mode=compile $(CC) -Iext/date/lib -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -DHAVE_TIMELIB_CONFIG_H=1 -Iext/date/ -I/home/$USER/software/sources/php/php-src/ext/date/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/date/lib/parse_iso_intervals.c -o ext/date/lib/parse_iso_intervals.lo 
ext/date/lib/interval.lo: /home/$USER/software/sources/php/php-src/ext/date/lib/interval.c
	$(LIBTOOL) --mode=compile $(CC) -Iext/date/lib -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -DHAVE_TIMELIB_CONFIG_H=1 -Iext/date/ -I/home/$USER/software/sources/php/php-src/ext/date/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/date/lib/interval.c -o ext/date/lib/interval.lo 
ext/libxml/libxml.lo: /home/$USER/software/sources/php/php-src/ext/libxml/libxml.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/libxml/ -I/home/$USER/software/sources/php/php-src/ext/libxml/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/libxml/libxml.c -o ext/libxml/libxml.lo 
ext/openssl/openssl.lo: /home/$USER/software/sources/php/php-src/ext/openssl/openssl.c
	$(LIBTOOL) --mode=compile $(CC)  -Iext/openssl/ -I/home/$USER/software/sources/php/php-src/ext/openssl/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/openssl/openssl.c -o ext/openssl/openssl.lo 
ext/openssl/xp_ssl.lo: /home/$USER/software/sources/php/php-src/ext/openssl/xp_ssl.c
	$(LIBTOOL) --mode=compile $(CC)  -Iext/openssl/ -I/home/$USER/software/sources/php/php-src/ext/openssl/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/openssl/xp_ssl.c -o ext/openssl/xp_ssl.lo 
ext/pcre/pcre2lib/pcre2_auto_possess.lo: /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_auto_possess.c
	$(LIBTOOL) --mode=compile $(CC) -DHAVE_CONFIG_H -I/home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/pcre/ -I/home/$USER/software/sources/php/php-src/ext/pcre/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_auto_possess.c -o ext/pcre/pcre2lib/pcre2_auto_possess.lo 
ext/pcre/pcre2lib/pcre2_chartables.lo: /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_chartables.c
	$(LIBTOOL) --mode=compile $(CC) -DHAVE_CONFIG_H -I/home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/pcre/ -I/home/$USER/software/sources/php/php-src/ext/pcre/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_chartables.c -o ext/pcre/pcre2lib/pcre2_chartables.lo 
ext/pcre/pcre2lib/pcre2_compile.lo: /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_compile.c
	$(LIBTOOL) --mode=compile $(CC) -DHAVE_CONFIG_H -I/home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/pcre/ -I/home/$USER/software/sources/php/php-src/ext/pcre/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_compile.c -o ext/pcre/pcre2lib/pcre2_compile.lo 
ext/pcre/pcre2lib/pcre2_config.lo: /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_config.c
	$(LIBTOOL) --mode=compile $(CC) -DHAVE_CONFIG_H -I/home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/pcre/ -I/home/$USER/software/sources/php/php-src/ext/pcre/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_config.c -o ext/pcre/pcre2lib/pcre2_config.lo 
ext/pcre/pcre2lib/pcre2_context.lo: /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_context.c
	$(LIBTOOL) --mode=compile $(CC) -DHAVE_CONFIG_H -I/home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/pcre/ -I/home/$USER/software/sources/php/php-src/ext/pcre/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_context.c -o ext/pcre/pcre2lib/pcre2_context.lo 
ext/pcre/pcre2lib/pcre2_dfa_match.lo: /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_dfa_match.c
	$(LIBTOOL) --mode=compile $(CC) -DHAVE_CONFIG_H -I/home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/pcre/ -I/home/$USER/software/sources/php/php-src/ext/pcre/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_dfa_match.c -o ext/pcre/pcre2lib/pcre2_dfa_match.lo 
ext/pcre/pcre2lib/pcre2_error.lo: /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_error.c
	$(LIBTOOL) --mode=compile $(CC) -DHAVE_CONFIG_H -I/home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/pcre/ -I/home/$USER/software/sources/php/php-src/ext/pcre/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_error.c -o ext/pcre/pcre2lib/pcre2_error.lo 
ext/pcre/pcre2lib/pcre2_jit_compile.lo: /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_jit_compile.c
	$(LIBTOOL) --mode=compile $(CC) -DHAVE_CONFIG_H -I/home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/pcre/ -I/home/$USER/software/sources/php/php-src/ext/pcre/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_jit_compile.c -o ext/pcre/pcre2lib/pcre2_jit_compile.lo 
ext/pcre/pcre2lib/pcre2_maketables.lo: /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_maketables.c
	$(LIBTOOL) --mode=compile $(CC) -DHAVE_CONFIG_H -I/home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/pcre/ -I/home/$USER/software/sources/php/php-src/ext/pcre/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_maketables.c -o ext/pcre/pcre2lib/pcre2_maketables.lo 
ext/pcre/pcre2lib/pcre2_match.lo: /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_match.c
	$(LIBTOOL) --mode=compile $(CC) -DHAVE_CONFIG_H -I/home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/pcre/ -I/home/$USER/software/sources/php/php-src/ext/pcre/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_match.c -o ext/pcre/pcre2lib/pcre2_match.lo 
ext/pcre/pcre2lib/pcre2_match_data.lo: /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_match_data.c
	$(LIBTOOL) --mode=compile $(CC) -DHAVE_CONFIG_H -I/home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/pcre/ -I/home/$USER/software/sources/php/php-src/ext/pcre/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_match_data.c -o ext/pcre/pcre2lib/pcre2_match_data.lo 
ext/pcre/pcre2lib/pcre2_newline.lo: /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_newline.c
	$(LIBTOOL) --mode=compile $(CC) -DHAVE_CONFIG_H -I/home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/pcre/ -I/home/$USER/software/sources/php/php-src/ext/pcre/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_newline.c -o ext/pcre/pcre2lib/pcre2_newline.lo 
ext/pcre/pcre2lib/pcre2_ord2utf.lo: /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_ord2utf.c
	$(LIBTOOL) --mode=compile $(CC) -DHAVE_CONFIG_H -I/home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/pcre/ -I/home/$USER/software/sources/php/php-src/ext/pcre/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_ord2utf.c -o ext/pcre/pcre2lib/pcre2_ord2utf.lo 
ext/pcre/pcre2lib/pcre2_pattern_info.lo: /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_pattern_info.c
	$(LIBTOOL) --mode=compile $(CC) -DHAVE_CONFIG_H -I/home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/pcre/ -I/home/$USER/software/sources/php/php-src/ext/pcre/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_pattern_info.c -o ext/pcre/pcre2lib/pcre2_pattern_info.lo 
ext/pcre/pcre2lib/pcre2_serialize.lo: /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_serialize.c
	$(LIBTOOL) --mode=compile $(CC) -DHAVE_CONFIG_H -I/home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/pcre/ -I/home/$USER/software/sources/php/php-src/ext/pcre/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_serialize.c -o ext/pcre/pcre2lib/pcre2_serialize.lo 
ext/pcre/pcre2lib/pcre2_string_utils.lo: /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_string_utils.c
	$(LIBTOOL) --mode=compile $(CC) -DHAVE_CONFIG_H -I/home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/pcre/ -I/home/$USER/software/sources/php/php-src/ext/pcre/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_string_utils.c -o ext/pcre/pcre2lib/pcre2_string_utils.lo 
ext/pcre/pcre2lib/pcre2_study.lo: /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_study.c
	$(LIBTOOL) --mode=compile $(CC) -DHAVE_CONFIG_H -I/home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/pcre/ -I/home/$USER/software/sources/php/php-src/ext/pcre/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_study.c -o ext/pcre/pcre2lib/pcre2_study.lo 
ext/pcre/pcre2lib/pcre2_substitute.lo: /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_substitute.c
	$(LIBTOOL) --mode=compile $(CC) -DHAVE_CONFIG_H -I/home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/pcre/ -I/home/$USER/software/sources/php/php-src/ext/pcre/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_substitute.c -o ext/pcre/pcre2lib/pcre2_substitute.lo 
ext/pcre/pcre2lib/pcre2_substring.lo: /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_substring.c
	$(LIBTOOL) --mode=compile $(CC) -DHAVE_CONFIG_H -I/home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/pcre/ -I/home/$USER/software/sources/php/php-src/ext/pcre/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_substring.c -o ext/pcre/pcre2lib/pcre2_substring.lo 
ext/pcre/pcre2lib/pcre2_tables.lo: /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_tables.c
	$(LIBTOOL) --mode=compile $(CC) -DHAVE_CONFIG_H -I/home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/pcre/ -I/home/$USER/software/sources/php/php-src/ext/pcre/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_tables.c -o ext/pcre/pcre2lib/pcre2_tables.lo 
ext/pcre/pcre2lib/pcre2_ucd.lo: /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_ucd.c
	$(LIBTOOL) --mode=compile $(CC) -DHAVE_CONFIG_H -I/home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/pcre/ -I/home/$USER/software/sources/php/php-src/ext/pcre/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_ucd.c -o ext/pcre/pcre2lib/pcre2_ucd.lo 
ext/pcre/pcre2lib/pcre2_valid_utf.lo: /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_valid_utf.c
	$(LIBTOOL) --mode=compile $(CC) -DHAVE_CONFIG_H -I/home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/pcre/ -I/home/$USER/software/sources/php/php-src/ext/pcre/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_valid_utf.c -o ext/pcre/pcre2lib/pcre2_valid_utf.lo 
ext/pcre/pcre2lib/pcre2_xclass.lo: /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_xclass.c
	$(LIBTOOL) --mode=compile $(CC) -DHAVE_CONFIG_H -I/home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/pcre/ -I/home/$USER/software/sources/php/php-src/ext/pcre/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_xclass.c -o ext/pcre/pcre2lib/pcre2_xclass.lo 
ext/pcre/pcre2lib/pcre2_find_bracket.lo: /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_find_bracket.c
	$(LIBTOOL) --mode=compile $(CC) -DHAVE_CONFIG_H -I/home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/pcre/ -I/home/$USER/software/sources/php/php-src/ext/pcre/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_find_bracket.c -o ext/pcre/pcre2lib/pcre2_find_bracket.lo 
ext/pcre/pcre2lib/pcre2_convert.lo: /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_convert.c
	$(LIBTOOL) --mode=compile $(CC) -DHAVE_CONFIG_H -I/home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/pcre/ -I/home/$USER/software/sources/php/php-src/ext/pcre/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_convert.c -o ext/pcre/pcre2lib/pcre2_convert.lo 
ext/pcre/pcre2lib/pcre2_extuni.lo: /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_extuni.c
	$(LIBTOOL) --mode=compile $(CC) -DHAVE_CONFIG_H -I/home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/pcre/ -I/home/$USER/software/sources/php/php-src/ext/pcre/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_extuni.c -o ext/pcre/pcre2lib/pcre2_extuni.lo 
ext/pcre/pcre2lib/pcre2_script_run.lo: /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_script_run.c
	$(LIBTOOL) --mode=compile $(CC) -DHAVE_CONFIG_H -I/home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/pcre/ -I/home/$USER/software/sources/php/php-src/ext/pcre/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib/pcre2_script_run.c -o ext/pcre/pcre2lib/pcre2_script_run.lo 
ext/pcre/php_pcre.lo: /home/$USER/software/sources/php/php-src/ext/pcre/php_pcre.c
	$(LIBTOOL) --mode=compile $(CC) -DHAVE_CONFIG_H -I/home/$USER/software/sources/php/php-src/ext/pcre/pcre2lib -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/pcre/ -I/home/$USER/software/sources/php/php-src/ext/pcre/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/pcre/php_pcre.c -o ext/pcre/php_pcre.lo 
ext/sqlite3/sqlite3.lo: /home/$USER/software/sources/php/php-src/ext/sqlite3/sqlite3.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/sqlite3/ -I/home/$USER/software/sources/php/php-src/ext/sqlite3/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/sqlite3/sqlite3.c -o ext/sqlite3/sqlite3.lo 
ext/zlib/zlib.lo: /home/$USER/software/sources/php/php-src/ext/zlib/zlib.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/zlib/ -I/home/$USER/software/sources/php/php-src/ext/zlib/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/zlib/zlib.c -o ext/zlib/zlib.lo 
ext/zlib/zlib_fopen_wrapper.lo: /home/$USER/software/sources/php/php-src/ext/zlib/zlib_fopen_wrapper.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/zlib/ -I/home/$USER/software/sources/php/php-src/ext/zlib/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/zlib/zlib_fopen_wrapper.c -o ext/zlib/zlib_fopen_wrapper.lo 
ext/zlib/zlib_filter.lo: /home/$USER/software/sources/php/php-src/ext/zlib/zlib_filter.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/zlib/ -I/home/$USER/software/sources/php/php-src/ext/zlib/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/zlib/zlib_filter.c -o ext/zlib/zlib_filter.lo 
ext/ctype/ctype.lo: /home/$USER/software/sources/php/php-src/ext/ctype/ctype.c
	$(LIBTOOL) --mode=compile $(CC)  -Iext/ctype/ -I/home/$USER/software/sources/php/php-src/ext/ctype/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/ctype/ctype.c -o ext/ctype/ctype.lo 
ext/curl/interface.lo: /home/$USER/software/sources/php/php-src/ext/curl/interface.c
	$(LIBTOOL) --mode=compile $(CC)  -Iext/curl/ -I/home/$USER/software/sources/php/php-src/ext/curl/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/curl/interface.c -o ext/curl/interface.lo 
ext/curl/multi.lo: /home/$USER/software/sources/php/php-src/ext/curl/multi.c
	$(LIBTOOL) --mode=compile $(CC)  -Iext/curl/ -I/home/$USER/software/sources/php/php-src/ext/curl/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/curl/multi.c -o ext/curl/multi.lo 
ext/curl/share.lo: /home/$USER/software/sources/php/php-src/ext/curl/share.c
	$(LIBTOOL) --mode=compile $(CC)  -Iext/curl/ -I/home/$USER/software/sources/php/php-src/ext/curl/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/curl/share.c -o ext/curl/share.lo 
ext/curl/curl_file.lo: /home/$USER/software/sources/php/php-src/ext/curl/curl_file.c
	$(LIBTOOL) --mode=compile $(CC)  -Iext/curl/ -I/home/$USER/software/sources/php/php-src/ext/curl/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/curl/curl_file.c -o ext/curl/curl_file.lo 
ext/dom/php_dom.lo: /home/$USER/software/sources/php/php-src/ext/dom/php_dom.c
	$(LIBTOOL) --mode=compile $(CC)  -Iext/dom/ -I/home/$USER/software/sources/php/php-src/ext/dom/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/dom/php_dom.c -o ext/dom/php_dom.lo 
ext/dom/attr.lo: /home/$USER/software/sources/php/php-src/ext/dom/attr.c
	$(LIBTOOL) --mode=compile $(CC)  -Iext/dom/ -I/home/$USER/software/sources/php/php-src/ext/dom/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/dom/attr.c -o ext/dom/attr.lo 
ext/dom/document.lo: /home/$USER/software/sources/php/php-src/ext/dom/document.c
	$(LIBTOOL) --mode=compile $(CC)  -Iext/dom/ -I/home/$USER/software/sources/php/php-src/ext/dom/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/dom/document.c -o ext/dom/document.lo 
ext/dom/domexception.lo: /home/$USER/software/sources/php/php-src/ext/dom/domexception.c
	$(LIBTOOL) --mode=compile $(CC)  -Iext/dom/ -I/home/$USER/software/sources/php/php-src/ext/dom/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/dom/domexception.c -o ext/dom/domexception.lo 
ext/dom/parentnode.lo: /home/$USER/software/sources/php/php-src/ext/dom/parentnode.c
	$(LIBTOOL) --mode=compile $(CC)  -Iext/dom/ -I/home/$USER/software/sources/php/php-src/ext/dom/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/dom/parentnode.c -o ext/dom/parentnode.lo 
ext/dom/processinginstruction.lo: /home/$USER/software/sources/php/php-src/ext/dom/processinginstruction.c
	$(LIBTOOL) --mode=compile $(CC)  -Iext/dom/ -I/home/$USER/software/sources/php/php-src/ext/dom/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/dom/processinginstruction.c -o ext/dom/processinginstruction.lo 
ext/dom/cdatasection.lo: /home/$USER/software/sources/php/php-src/ext/dom/cdatasection.c
	$(LIBTOOL) --mode=compile $(CC)  -Iext/dom/ -I/home/$USER/software/sources/php/php-src/ext/dom/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/dom/cdatasection.c -o ext/dom/cdatasection.lo 
ext/dom/documentfragment.lo: /home/$USER/software/sources/php/php-src/ext/dom/documentfragment.c
	$(LIBTOOL) --mode=compile $(CC)  -Iext/dom/ -I/home/$USER/software/sources/php/php-src/ext/dom/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/dom/documentfragment.c -o ext/dom/documentfragment.lo 
ext/dom/domimplementation.lo: /home/$USER/software/sources/php/php-src/ext/dom/domimplementation.c
	$(LIBTOOL) --mode=compile $(CC)  -Iext/dom/ -I/home/$USER/software/sources/php/php-src/ext/dom/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/dom/domimplementation.c -o ext/dom/domimplementation.lo 
ext/dom/element.lo: /home/$USER/software/sources/php/php-src/ext/dom/element.c
	$(LIBTOOL) --mode=compile $(CC)  -Iext/dom/ -I/home/$USER/software/sources/php/php-src/ext/dom/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/dom/element.c -o ext/dom/element.lo 
ext/dom/node.lo: /home/$USER/software/sources/php/php-src/ext/dom/node.c
	$(LIBTOOL) --mode=compile $(CC)  -Iext/dom/ -I/home/$USER/software/sources/php/php-src/ext/dom/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/dom/node.c -o ext/dom/node.lo 
ext/dom/characterdata.lo: /home/$USER/software/sources/php/php-src/ext/dom/characterdata.c
	$(LIBTOOL) --mode=compile $(CC)  -Iext/dom/ -I/home/$USER/software/sources/php/php-src/ext/dom/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/dom/characterdata.c -o ext/dom/characterdata.lo 
ext/dom/documenttype.lo: /home/$USER/software/sources/php/php-src/ext/dom/documenttype.c
	$(LIBTOOL) --mode=compile $(CC)  -Iext/dom/ -I/home/$USER/software/sources/php/php-src/ext/dom/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/dom/documenttype.c -o ext/dom/documenttype.lo 
ext/dom/entity.lo: /home/$USER/software/sources/php/php-src/ext/dom/entity.c
	$(LIBTOOL) --mode=compile $(CC)  -Iext/dom/ -I/home/$USER/software/sources/php/php-src/ext/dom/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/dom/entity.c -o ext/dom/entity.lo 
ext/dom/nodelist.lo: /home/$USER/software/sources/php/php-src/ext/dom/nodelist.c
	$(LIBTOOL) --mode=compile $(CC)  -Iext/dom/ -I/home/$USER/software/sources/php/php-src/ext/dom/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/dom/nodelist.c -o ext/dom/nodelist.lo 
ext/dom/text.lo: /home/$USER/software/sources/php/php-src/ext/dom/text.c
	$(LIBTOOL) --mode=compile $(CC)  -Iext/dom/ -I/home/$USER/software/sources/php/php-src/ext/dom/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/dom/text.c -o ext/dom/text.lo 
ext/dom/comment.lo: /home/$USER/software/sources/php/php-src/ext/dom/comment.c
	$(LIBTOOL) --mode=compile $(CC)  -Iext/dom/ -I/home/$USER/software/sources/php/php-src/ext/dom/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/dom/comment.c -o ext/dom/comment.lo 
ext/dom/entityreference.lo: /home/$USER/software/sources/php/php-src/ext/dom/entityreference.c
	$(LIBTOOL) --mode=compile $(CC)  -Iext/dom/ -I/home/$USER/software/sources/php/php-src/ext/dom/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/dom/entityreference.c -o ext/dom/entityreference.lo 
ext/dom/notation.lo: /home/$USER/software/sources/php/php-src/ext/dom/notation.c
	$(LIBTOOL) --mode=compile $(CC)  -Iext/dom/ -I/home/$USER/software/sources/php/php-src/ext/dom/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/dom/notation.c -o ext/dom/notation.lo 
ext/dom/xpath.lo: /home/$USER/software/sources/php/php-src/ext/dom/xpath.c
	$(LIBTOOL) --mode=compile $(CC)  -Iext/dom/ -I/home/$USER/software/sources/php/php-src/ext/dom/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/dom/xpath.c -o ext/dom/xpath.lo 
ext/dom/dom_iterators.lo: /home/$USER/software/sources/php/php-src/ext/dom/dom_iterators.c
	$(LIBTOOL) --mode=compile $(CC)  -Iext/dom/ -I/home/$USER/software/sources/php/php-src/ext/dom/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/dom/dom_iterators.c -o ext/dom/dom_iterators.lo 
ext/dom/namednodemap.lo: /home/$USER/software/sources/php/php-src/ext/dom/namednodemap.c
	$(LIBTOOL) --mode=compile $(CC)  -Iext/dom/ -I/home/$USER/software/sources/php/php-src/ext/dom/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/dom/namednodemap.c -o ext/dom/namednodemap.lo 
ext/fileinfo/fileinfo.lo: /home/$USER/software/sources/php/php-src/ext/fileinfo/fileinfo.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic -Iext/fileinfo/ -I/home/$USER/software/sources/php/php-src/ext/fileinfo/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/fileinfo/fileinfo.c -o ext/fileinfo/fileinfo.lo 
ext/fileinfo/libmagic/apprentice.lo: /home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic/apprentice.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic -Iext/fileinfo/ -I/home/$USER/software/sources/php/php-src/ext/fileinfo/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic/apprentice.c -o ext/fileinfo/libmagic/apprentice.lo 
ext/fileinfo/libmagic/apptype.lo: /home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic/apptype.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic -Iext/fileinfo/ -I/home/$USER/software/sources/php/php-src/ext/fileinfo/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic/apptype.c -o ext/fileinfo/libmagic/apptype.lo 
ext/fileinfo/libmagic/ascmagic.lo: /home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic/ascmagic.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic -Iext/fileinfo/ -I/home/$USER/software/sources/php/php-src/ext/fileinfo/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic/ascmagic.c -o ext/fileinfo/libmagic/ascmagic.lo 
ext/fileinfo/libmagic/cdf.lo: /home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic/cdf.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic -Iext/fileinfo/ -I/home/$USER/software/sources/php/php-src/ext/fileinfo/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic/cdf.c -o ext/fileinfo/libmagic/cdf.lo 
ext/fileinfo/libmagic/cdf_time.lo: /home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic/cdf_time.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic -Iext/fileinfo/ -I/home/$USER/software/sources/php/php-src/ext/fileinfo/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic/cdf_time.c -o ext/fileinfo/libmagic/cdf_time.lo 
ext/fileinfo/libmagic/compress.lo: /home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic/compress.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic -Iext/fileinfo/ -I/home/$USER/software/sources/php/php-src/ext/fileinfo/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic/compress.c -o ext/fileinfo/libmagic/compress.lo 
ext/fileinfo/libmagic/encoding.lo: /home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic/encoding.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic -Iext/fileinfo/ -I/home/$USER/software/sources/php/php-src/ext/fileinfo/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic/encoding.c -o ext/fileinfo/libmagic/encoding.lo 
ext/fileinfo/libmagic/fsmagic.lo: /home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic/fsmagic.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic -Iext/fileinfo/ -I/home/$USER/software/sources/php/php-src/ext/fileinfo/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic/fsmagic.c -o ext/fileinfo/libmagic/fsmagic.lo 
ext/fileinfo/libmagic/funcs.lo: /home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic/funcs.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic -Iext/fileinfo/ -I/home/$USER/software/sources/php/php-src/ext/fileinfo/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic/funcs.c -o ext/fileinfo/libmagic/funcs.lo 
ext/fileinfo/libmagic/is_json.lo: /home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic/is_json.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic -Iext/fileinfo/ -I/home/$USER/software/sources/php/php-src/ext/fileinfo/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic/is_json.c -o ext/fileinfo/libmagic/is_json.lo 
ext/fileinfo/libmagic/is_tar.lo: /home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic/is_tar.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic -Iext/fileinfo/ -I/home/$USER/software/sources/php/php-src/ext/fileinfo/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic/is_tar.c -o ext/fileinfo/libmagic/is_tar.lo 
ext/fileinfo/libmagic/magic.lo: /home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic/magic.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic -Iext/fileinfo/ -I/home/$USER/software/sources/php/php-src/ext/fileinfo/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic/magic.c -o ext/fileinfo/libmagic/magic.lo 
ext/fileinfo/libmagic/print.lo: /home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic/print.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic -Iext/fileinfo/ -I/home/$USER/software/sources/php/php-src/ext/fileinfo/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic/print.c -o ext/fileinfo/libmagic/print.lo 
ext/fileinfo/libmagic/readcdf.lo: /home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic/readcdf.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic -Iext/fileinfo/ -I/home/$USER/software/sources/php/php-src/ext/fileinfo/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic/readcdf.c -o ext/fileinfo/libmagic/readcdf.lo 
ext/fileinfo/libmagic/softmagic.lo: /home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic/softmagic.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic -Iext/fileinfo/ -I/home/$USER/software/sources/php/php-src/ext/fileinfo/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic/softmagic.c -o ext/fileinfo/libmagic/softmagic.lo 
ext/fileinfo/libmagic/der.lo: /home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic/der.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic -Iext/fileinfo/ -I/home/$USER/software/sources/php/php-src/ext/fileinfo/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic/der.c -o ext/fileinfo/libmagic/der.lo 
ext/fileinfo/libmagic/buffer.lo: /home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic/buffer.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic -Iext/fileinfo/ -I/home/$USER/software/sources/php/php-src/ext/fileinfo/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/fileinfo/libmagic/buffer.c -o ext/fileinfo/libmagic/buffer.lo 
ext/filter/filter.lo: /home/$USER/software/sources/php/php-src/ext/filter/filter.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/filter/ -I/home/$USER/software/sources/php/php-src/ext/filter/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/filter/filter.c -o ext/filter/filter.lo 
ext/filter/sanitizing_filters.lo: /home/$USER/software/sources/php/php-src/ext/filter/sanitizing_filters.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/filter/ -I/home/$USER/software/sources/php/php-src/ext/filter/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/filter/sanitizing_filters.c -o ext/filter/sanitizing_filters.lo 
ext/filter/logical_filters.lo: /home/$USER/software/sources/php/php-src/ext/filter/logical_filters.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/filter/ -I/home/$USER/software/sources/php/php-src/ext/filter/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/filter/logical_filters.c -o ext/filter/logical_filters.lo 
ext/filter/callback_filter.lo: /home/$USER/software/sources/php/php-src/ext/filter/callback_filter.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/filter/ -I/home/$USER/software/sources/php/php-src/ext/filter/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/filter/callback_filter.c -o ext/filter/callback_filter.lo 
ext/hash/hash.lo: /home/$USER/software/sources/php/php-src/ext/hash/hash.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/$USER/software/sources/php/php-src/ext/hash/sha3/generic64lc -DKeccakP200_excluded -DKeccakP400_excluded -DKeccakP800_excluded -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/hash/ -I/home/$USER/software/sources/php/php-src/ext/hash/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/hash/hash.c -o ext/hash/hash.lo 
ext/hash/hash_md.lo: /home/$USER/software/sources/php/php-src/ext/hash/hash_md.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/$USER/software/sources/php/php-src/ext/hash/sha3/generic64lc -DKeccakP200_excluded -DKeccakP400_excluded -DKeccakP800_excluded -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/hash/ -I/home/$USER/software/sources/php/php-src/ext/hash/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/hash/hash_md.c -o ext/hash/hash_md.lo 
ext/hash/hash_sha.lo: /home/$USER/software/sources/php/php-src/ext/hash/hash_sha.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/$USER/software/sources/php/php-src/ext/hash/sha3/generic64lc -DKeccakP200_excluded -DKeccakP400_excluded -DKeccakP800_excluded -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/hash/ -I/home/$USER/software/sources/php/php-src/ext/hash/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/hash/hash_sha.c -o ext/hash/hash_sha.lo 
ext/hash/hash_ripemd.lo: /home/$USER/software/sources/php/php-src/ext/hash/hash_ripemd.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/$USER/software/sources/php/php-src/ext/hash/sha3/generic64lc -DKeccakP200_excluded -DKeccakP400_excluded -DKeccakP800_excluded -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/hash/ -I/home/$USER/software/sources/php/php-src/ext/hash/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/hash/hash_ripemd.c -o ext/hash/hash_ripemd.lo 
ext/hash/hash_haval.lo: /home/$USER/software/sources/php/php-src/ext/hash/hash_haval.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/$USER/software/sources/php/php-src/ext/hash/sha3/generic64lc -DKeccakP200_excluded -DKeccakP400_excluded -DKeccakP800_excluded -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/hash/ -I/home/$USER/software/sources/php/php-src/ext/hash/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/hash/hash_haval.c -o ext/hash/hash_haval.lo 
ext/hash/hash_tiger.lo: /home/$USER/software/sources/php/php-src/ext/hash/hash_tiger.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/$USER/software/sources/php/php-src/ext/hash/sha3/generic64lc -DKeccakP200_excluded -DKeccakP400_excluded -DKeccakP800_excluded -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/hash/ -I/home/$USER/software/sources/php/php-src/ext/hash/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/hash/hash_tiger.c -o ext/hash/hash_tiger.lo 
ext/hash/hash_gost.lo: /home/$USER/software/sources/php/php-src/ext/hash/hash_gost.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/$USER/software/sources/php/php-src/ext/hash/sha3/generic64lc -DKeccakP200_excluded -DKeccakP400_excluded -DKeccakP800_excluded -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/hash/ -I/home/$USER/software/sources/php/php-src/ext/hash/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/hash/hash_gost.c -o ext/hash/hash_gost.lo 
ext/hash/hash_snefru.lo: /home/$USER/software/sources/php/php-src/ext/hash/hash_snefru.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/$USER/software/sources/php/php-src/ext/hash/sha3/generic64lc -DKeccakP200_excluded -DKeccakP400_excluded -DKeccakP800_excluded -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/hash/ -I/home/$USER/software/sources/php/php-src/ext/hash/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/hash/hash_snefru.c -o ext/hash/hash_snefru.lo 
ext/hash/hash_whirlpool.lo: /home/$USER/software/sources/php/php-src/ext/hash/hash_whirlpool.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/$USER/software/sources/php/php-src/ext/hash/sha3/generic64lc -DKeccakP200_excluded -DKeccakP400_excluded -DKeccakP800_excluded -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/hash/ -I/home/$USER/software/sources/php/php-src/ext/hash/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/hash/hash_whirlpool.c -o ext/hash/hash_whirlpool.lo 
ext/hash/hash_adler32.lo: /home/$USER/software/sources/php/php-src/ext/hash/hash_adler32.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/$USER/software/sources/php/php-src/ext/hash/sha3/generic64lc -DKeccakP200_excluded -DKeccakP400_excluded -DKeccakP800_excluded -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/hash/ -I/home/$USER/software/sources/php/php-src/ext/hash/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/hash/hash_adler32.c -o ext/hash/hash_adler32.lo 
ext/hash/hash_crc32.lo: /home/$USER/software/sources/php/php-src/ext/hash/hash_crc32.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/$USER/software/sources/php/php-src/ext/hash/sha3/generic64lc -DKeccakP200_excluded -DKeccakP400_excluded -DKeccakP800_excluded -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/hash/ -I/home/$USER/software/sources/php/php-src/ext/hash/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/hash/hash_crc32.c -o ext/hash/hash_crc32.lo 
ext/hash/hash_fnv.lo: /home/$USER/software/sources/php/php-src/ext/hash/hash_fnv.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/$USER/software/sources/php/php-src/ext/hash/sha3/generic64lc -DKeccakP200_excluded -DKeccakP400_excluded -DKeccakP800_excluded -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/hash/ -I/home/$USER/software/sources/php/php-src/ext/hash/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/hash/hash_fnv.c -o ext/hash/hash_fnv.lo 
ext/hash/hash_joaat.lo: /home/$USER/software/sources/php/php-src/ext/hash/hash_joaat.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/$USER/software/sources/php/php-src/ext/hash/sha3/generic64lc -DKeccakP200_excluded -DKeccakP400_excluded -DKeccakP800_excluded -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/hash/ -I/home/$USER/software/sources/php/php-src/ext/hash/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/hash/hash_joaat.c -o ext/hash/hash_joaat.lo 
ext/hash/sha3/generic64lc/KeccakP-1600-opt64.lo: /home/$USER/software/sources/php/php-src/ext/hash/sha3/generic64lc/KeccakP-1600-opt64.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/$USER/software/sources/php/php-src/ext/hash/sha3/generic64lc -DKeccakP200_excluded -DKeccakP400_excluded -DKeccakP800_excluded -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/hash/ -I/home/$USER/software/sources/php/php-src/ext/hash/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/hash/sha3/generic64lc/KeccakP-1600-opt64.c -o ext/hash/sha3/generic64lc/KeccakP-1600-opt64.lo 
ext/hash/sha3/generic64lc/KeccakHash.lo: /home/$USER/software/sources/php/php-src/ext/hash/sha3/generic64lc/KeccakHash.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/$USER/software/sources/php/php-src/ext/hash/sha3/generic64lc -DKeccakP200_excluded -DKeccakP400_excluded -DKeccakP800_excluded -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/hash/ -I/home/$USER/software/sources/php/php-src/ext/hash/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/hash/sha3/generic64lc/KeccakHash.c -o ext/hash/sha3/generic64lc/KeccakHash.lo 
ext/hash/sha3/generic64lc/KeccakSponge.lo: /home/$USER/software/sources/php/php-src/ext/hash/sha3/generic64lc/KeccakSponge.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/$USER/software/sources/php/php-src/ext/hash/sha3/generic64lc -DKeccakP200_excluded -DKeccakP400_excluded -DKeccakP800_excluded -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/hash/ -I/home/$USER/software/sources/php/php-src/ext/hash/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/hash/sha3/generic64lc/KeccakSponge.c -o ext/hash/sha3/generic64lc/KeccakSponge.lo 
ext/hash/hash_sha3.lo: /home/$USER/software/sources/php/php-src/ext/hash/hash_sha3.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/$USER/software/sources/php/php-src/ext/hash/sha3/generic64lc -DKeccakP200_excluded -DKeccakP400_excluded -DKeccakP800_excluded -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/hash/ -I/home/$USER/software/sources/php/php-src/ext/hash/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/hash/hash_sha3.c -o ext/hash/hash_sha3.lo 
ext/iconv/iconv.lo: /home/$USER/software/sources/php/php-src/ext/iconv/iconv.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/iconv/ -I/home/$USER/software/sources/php/php-src/ext/iconv/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/iconv/iconv.c -o ext/iconv/iconv.lo 
ext/json/json.lo: /home/$USER/software/sources/php/php-src/ext/json/json.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/json/ -I/home/$USER/software/sources/php/php-src/ext/json/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/json/json.c -o ext/json/json.lo 
ext/json/json_encoder.lo: /home/$USER/software/sources/php/php-src/ext/json/json_encoder.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/json/ -I/home/$USER/software/sources/php/php-src/ext/json/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/json/json_encoder.c -o ext/json/json_encoder.lo 
ext/json/json_parser.lo: /home/$USER/software/sources/php/php-src/ext/json/json_parser.tab.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/json/ -I/home/$USER/software/sources/php/php-src/ext/json/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/json/json_parser.tab.c -o ext/json/json_parser.lo 
ext/json/json_scanner.lo: /home/$USER/software/sources/php/php-src/ext/json/json_scanner.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/json/ -I/home/$USER/software/sources/php/php-src/ext/json/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/json/json_scanner.c -o ext/json/json_scanner.lo 
ext/opcache/ZendAccelerator.lo: /home/$USER/software/sources/php/php-src/ext/opcache/ZendAccelerator.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/opcache/ -I/home/$USER/software/sources/php/php-src/ext/opcache/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/$USER/software/sources/php/php-src/ext/opcache/ZendAccelerator.c -o ext/opcache/ZendAccelerator.lo 
ext/opcache/zend_accelerator_blacklist.lo: /home/$USER/software/sources/php/php-src/ext/opcache/zend_accelerator_blacklist.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/opcache/ -I/home/$USER/software/sources/php/php-src/ext/opcache/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/$USER/software/sources/php/php-src/ext/opcache/zend_accelerator_blacklist.c -o ext/opcache/zend_accelerator_blacklist.lo 
ext/opcache/zend_accelerator_debug.lo: /home/$USER/software/sources/php/php-src/ext/opcache/zend_accelerator_debug.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/opcache/ -I/home/$USER/software/sources/php/php-src/ext/opcache/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/$USER/software/sources/php/php-src/ext/opcache/zend_accelerator_debug.c -o ext/opcache/zend_accelerator_debug.lo 
ext/opcache/zend_accelerator_hash.lo: /home/$USER/software/sources/php/php-src/ext/opcache/zend_accelerator_hash.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/opcache/ -I/home/$USER/software/sources/php/php-src/ext/opcache/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/$USER/software/sources/php/php-src/ext/opcache/zend_accelerator_hash.c -o ext/opcache/zend_accelerator_hash.lo 
ext/opcache/zend_accelerator_module.lo: /home/$USER/software/sources/php/php-src/ext/opcache/zend_accelerator_module.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/opcache/ -I/home/$USER/software/sources/php/php-src/ext/opcache/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/$USER/software/sources/php/php-src/ext/opcache/zend_accelerator_module.c -o ext/opcache/zend_accelerator_module.lo 
ext/opcache/zend_persist.lo: /home/$USER/software/sources/php/php-src/ext/opcache/zend_persist.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/opcache/ -I/home/$USER/software/sources/php/php-src/ext/opcache/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/$USER/software/sources/php/php-src/ext/opcache/zend_persist.c -o ext/opcache/zend_persist.lo 
ext/opcache/zend_persist_calc.lo: /home/$USER/software/sources/php/php-src/ext/opcache/zend_persist_calc.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/opcache/ -I/home/$USER/software/sources/php/php-src/ext/opcache/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/$USER/software/sources/php/php-src/ext/opcache/zend_persist_calc.c -o ext/opcache/zend_persist_calc.lo 
ext/opcache/zend_file_cache.lo: /home/$USER/software/sources/php/php-src/ext/opcache/zend_file_cache.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/opcache/ -I/home/$USER/software/sources/php/php-src/ext/opcache/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/$USER/software/sources/php/php-src/ext/opcache/zend_file_cache.c -o ext/opcache/zend_file_cache.lo 
ext/opcache/zend_shared_alloc.lo: /home/$USER/software/sources/php/php-src/ext/opcache/zend_shared_alloc.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/opcache/ -I/home/$USER/software/sources/php/php-src/ext/opcache/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/$USER/software/sources/php/php-src/ext/opcache/zend_shared_alloc.c -o ext/opcache/zend_shared_alloc.lo 
ext/opcache/zend_accelerator_util_funcs.lo: /home/$USER/software/sources/php/php-src/ext/opcache/zend_accelerator_util_funcs.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/opcache/ -I/home/$USER/software/sources/php/php-src/ext/opcache/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/$USER/software/sources/php/php-src/ext/opcache/zend_accelerator_util_funcs.c -o ext/opcache/zend_accelerator_util_funcs.lo 
ext/opcache/shared_alloc_shm.lo: /home/$USER/software/sources/php/php-src/ext/opcache/shared_alloc_shm.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/opcache/ -I/home/$USER/software/sources/php/php-src/ext/opcache/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/$USER/software/sources/php/php-src/ext/opcache/shared_alloc_shm.c -o ext/opcache/shared_alloc_shm.lo 
ext/opcache/shared_alloc_mmap.lo: /home/$USER/software/sources/php/php-src/ext/opcache/shared_alloc_mmap.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/opcache/ -I/home/$USER/software/sources/php/php-src/ext/opcache/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/$USER/software/sources/php/php-src/ext/opcache/shared_alloc_mmap.c -o ext/opcache/shared_alloc_mmap.lo 
ext/opcache/shared_alloc_posix.lo: /home/$USER/software/sources/php/php-src/ext/opcache/shared_alloc_posix.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/opcache/ -I/home/$USER/software/sources/php/php-src/ext/opcache/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/$USER/software/sources/php/php-src/ext/opcache/shared_alloc_posix.c -o ext/opcache/shared_alloc_posix.lo 
ext/opcache/Optimizer/zend_optimizer.lo: /home/$USER/software/sources/php/php-src/ext/opcache/Optimizer/zend_optimizer.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/opcache/ -I/home/$USER/software/sources/php/php-src/ext/opcache/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/$USER/software/sources/php/php-src/ext/opcache/Optimizer/zend_optimizer.c -o ext/opcache/Optimizer/zend_optimizer.lo 
ext/opcache/Optimizer/pass1.lo: /home/$USER/software/sources/php/php-src/ext/opcache/Optimizer/pass1.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/opcache/ -I/home/$USER/software/sources/php/php-src/ext/opcache/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/$USER/software/sources/php/php-src/ext/opcache/Optimizer/pass1.c -o ext/opcache/Optimizer/pass1.lo 
ext/opcache/Optimizer/pass3.lo: /home/$USER/software/sources/php/php-src/ext/opcache/Optimizer/pass3.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/opcache/ -I/home/$USER/software/sources/php/php-src/ext/opcache/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/$USER/software/sources/php/php-src/ext/opcache/Optimizer/pass3.c -o ext/opcache/Optimizer/pass3.lo 
ext/opcache/Optimizer/optimize_func_calls.lo: /home/$USER/software/sources/php/php-src/ext/opcache/Optimizer/optimize_func_calls.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/opcache/ -I/home/$USER/software/sources/php/php-src/ext/opcache/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/$USER/software/sources/php/php-src/ext/opcache/Optimizer/optimize_func_calls.c -o ext/opcache/Optimizer/optimize_func_calls.lo 
ext/opcache/Optimizer/block_pass.lo: /home/$USER/software/sources/php/php-src/ext/opcache/Optimizer/block_pass.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/opcache/ -I/home/$USER/software/sources/php/php-src/ext/opcache/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/$USER/software/sources/php/php-src/ext/opcache/Optimizer/block_pass.c -o ext/opcache/Optimizer/block_pass.lo 
ext/opcache/Optimizer/optimize_temp_vars_5.lo: /home/$USER/software/sources/php/php-src/ext/opcache/Optimizer/optimize_temp_vars_5.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/opcache/ -I/home/$USER/software/sources/php/php-src/ext/opcache/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/$USER/software/sources/php/php-src/ext/opcache/Optimizer/optimize_temp_vars_5.c -o ext/opcache/Optimizer/optimize_temp_vars_5.lo 
ext/opcache/Optimizer/nop_removal.lo: /home/$USER/software/sources/php/php-src/ext/opcache/Optimizer/nop_removal.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/opcache/ -I/home/$USER/software/sources/php/php-src/ext/opcache/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/$USER/software/sources/php/php-src/ext/opcache/Optimizer/nop_removal.c -o ext/opcache/Optimizer/nop_removal.lo 
ext/opcache/Optimizer/compact_literals.lo: /home/$USER/software/sources/php/php-src/ext/opcache/Optimizer/compact_literals.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/opcache/ -I/home/$USER/software/sources/php/php-src/ext/opcache/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/$USER/software/sources/php/php-src/ext/opcache/Optimizer/compact_literals.c -o ext/opcache/Optimizer/compact_literals.lo 
ext/opcache/Optimizer/zend_cfg.lo: /home/$USER/software/sources/php/php-src/ext/opcache/Optimizer/zend_cfg.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/opcache/ -I/home/$USER/software/sources/php/php-src/ext/opcache/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/$USER/software/sources/php/php-src/ext/opcache/Optimizer/zend_cfg.c -o ext/opcache/Optimizer/zend_cfg.lo 
ext/opcache/Optimizer/zend_dfg.lo: /home/$USER/software/sources/php/php-src/ext/opcache/Optimizer/zend_dfg.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/opcache/ -I/home/$USER/software/sources/php/php-src/ext/opcache/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/$USER/software/sources/php/php-src/ext/opcache/Optimizer/zend_dfg.c -o ext/opcache/Optimizer/zend_dfg.lo 
ext/opcache/Optimizer/dfa_pass.lo: /home/$USER/software/sources/php/php-src/ext/opcache/Optimizer/dfa_pass.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/opcache/ -I/home/$USER/software/sources/php/php-src/ext/opcache/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/$USER/software/sources/php/php-src/ext/opcache/Optimizer/dfa_pass.c -o ext/opcache/Optimizer/dfa_pass.lo 
ext/opcache/Optimizer/zend_ssa.lo: /home/$USER/software/sources/php/php-src/ext/opcache/Optimizer/zend_ssa.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/opcache/ -I/home/$USER/software/sources/php/php-src/ext/opcache/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/$USER/software/sources/php/php-src/ext/opcache/Optimizer/zend_ssa.c -o ext/opcache/Optimizer/zend_ssa.lo 
ext/opcache/Optimizer/zend_inference.lo: /home/$USER/software/sources/php/php-src/ext/opcache/Optimizer/zend_inference.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/opcache/ -I/home/$USER/software/sources/php/php-src/ext/opcache/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/$USER/software/sources/php/php-src/ext/opcache/Optimizer/zend_inference.c -o ext/opcache/Optimizer/zend_inference.lo 
ext/opcache/Optimizer/zend_func_info.lo: /home/$USER/software/sources/php/php-src/ext/opcache/Optimizer/zend_func_info.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/opcache/ -I/home/$USER/software/sources/php/php-src/ext/opcache/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/$USER/software/sources/php/php-src/ext/opcache/Optimizer/zend_func_info.c -o ext/opcache/Optimizer/zend_func_info.lo 
ext/opcache/Optimizer/zend_call_graph.lo: /home/$USER/software/sources/php/php-src/ext/opcache/Optimizer/zend_call_graph.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/opcache/ -I/home/$USER/software/sources/php/php-src/ext/opcache/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/$USER/software/sources/php/php-src/ext/opcache/Optimizer/zend_call_graph.c -o ext/opcache/Optimizer/zend_call_graph.lo 
ext/opcache/Optimizer/sccp.lo: /home/$USER/software/sources/php/php-src/ext/opcache/Optimizer/sccp.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/opcache/ -I/home/$USER/software/sources/php/php-src/ext/opcache/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/$USER/software/sources/php/php-src/ext/opcache/Optimizer/sccp.c -o ext/opcache/Optimizer/sccp.lo 
ext/opcache/Optimizer/scdf.lo: /home/$USER/software/sources/php/php-src/ext/opcache/Optimizer/scdf.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/opcache/ -I/home/$USER/software/sources/php/php-src/ext/opcache/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/$USER/software/sources/php/php-src/ext/opcache/Optimizer/scdf.c -o ext/opcache/Optimizer/scdf.lo 
ext/opcache/Optimizer/dce.lo: /home/$USER/software/sources/php/php-src/ext/opcache/Optimizer/dce.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/opcache/ -I/home/$USER/software/sources/php/php-src/ext/opcache/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/$USER/software/sources/php/php-src/ext/opcache/Optimizer/dce.c -o ext/opcache/Optimizer/dce.lo 
ext/opcache/Optimizer/escape_analysis.lo: /home/$USER/software/sources/php/php-src/ext/opcache/Optimizer/escape_analysis.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/opcache/ -I/home/$USER/software/sources/php/php-src/ext/opcache/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/$USER/software/sources/php/php-src/ext/opcache/Optimizer/escape_analysis.c -o ext/opcache/Optimizer/escape_analysis.lo 
ext/opcache/Optimizer/compact_vars.lo: /home/$USER/software/sources/php/php-src/ext/opcache/Optimizer/compact_vars.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/opcache/ -I/home/$USER/software/sources/php/php-src/ext/opcache/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/$USER/software/sources/php/php-src/ext/opcache/Optimizer/compact_vars.c -o ext/opcache/Optimizer/compact_vars.lo 
ext/opcache/Optimizer/zend_dump.lo: /home/$USER/software/sources/php/php-src/ext/opcache/Optimizer/zend_dump.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/opcache/ -I/home/$USER/software/sources/php/php-src/ext/opcache/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/$USER/software/sources/php/php-src/ext/opcache/Optimizer/zend_dump.c -o ext/opcache/Optimizer/zend_dump.lo 
ext/opcache/jit/zend_jit.lo: /home/$USER/software/sources/php/php-src/ext/opcache/jit/zend_jit.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/opcache/ -I/home/$USER/software/sources/php/php-src/ext/opcache/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/$USER/software/sources/php/php-src/ext/opcache/jit/zend_jit.c -o ext/opcache/jit/zend_jit.lo 
ext/opcache/jit/zend_jit_vm_helpers.lo: /home/$USER/software/sources/php/php-src/ext/opcache/jit/zend_jit_vm_helpers.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/opcache/ -I/home/$USER/software/sources/php/php-src/ext/opcache/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/$USER/software/sources/php/php-src/ext/opcache/jit/zend_jit_vm_helpers.c -o ext/opcache/jit/zend_jit_vm_helpers.lo 
$(phplibdir)/opcache.la: ext/opcache/opcache.la
	$(LIBTOOL) --mode=install cp ext/opcache/opcache.la $(phplibdir)

ext/opcache/opcache.la: $(shared_objects_opcache) $(OPCACHE_SHARED_DEPENDENCIES)
	$(LIBTOOL) --mode=link $(CC) -shared $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) $(LDFLAGS)  -o $@ -export-dynamic -avoid-version -prefer-pic -module -rpath $(phplibdir) $(EXTRA_LDFLAGS) $(shared_objects_opcache) $(OPCACHE_SHARED_LIBADD)

ext/pdo/pdo.lo: /home/$USER/software/sources/php/php-src/ext/pdo/pdo.c
	$(LIBTOOL) --mode=compile $(CC)  -Iext/pdo/ -I/home/$USER/software/sources/php/php-src/ext/pdo/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/pdo/pdo.c -o ext/pdo/pdo.lo 
ext/pdo/pdo_dbh.lo: /home/$USER/software/sources/php/php-src/ext/pdo/pdo_dbh.c
	$(LIBTOOL) --mode=compile $(CC)  -Iext/pdo/ -I/home/$USER/software/sources/php/php-src/ext/pdo/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/pdo/pdo_dbh.c -o ext/pdo/pdo_dbh.lo 
ext/pdo/pdo_stmt.lo: /home/$USER/software/sources/php/php-src/ext/pdo/pdo_stmt.c
	$(LIBTOOL) --mode=compile $(CC)  -Iext/pdo/ -I/home/$USER/software/sources/php/php-src/ext/pdo/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/pdo/pdo_stmt.c -o ext/pdo/pdo_stmt.lo 
ext/pdo/pdo_sql_parser.lo: /home/$USER/software/sources/php/php-src/ext/pdo/pdo_sql_parser.c
	$(LIBTOOL) --mode=compile $(CC)  -Iext/pdo/ -I/home/$USER/software/sources/php/php-src/ext/pdo/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/pdo/pdo_sql_parser.c -o ext/pdo/pdo_sql_parser.lo 
ext/pdo/pdo_sqlstate.lo: /home/$USER/software/sources/php/php-src/ext/pdo/pdo_sqlstate.c
	$(LIBTOOL) --mode=compile $(CC)  -Iext/pdo/ -I/home/$USER/software/sources/php/php-src/ext/pdo/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/pdo/pdo_sqlstate.c -o ext/pdo/pdo_sqlstate.lo 
ext/pdo_sqlite/pdo_sqlite.lo: /home/$USER/software/sources/php/php-src/ext/pdo_sqlite/pdo_sqlite.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/$USER/software/sources/php/php-src/ext -Iext/pdo_sqlite/ -I/home/$USER/software/sources/php/php-src/ext/pdo_sqlite/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/pdo_sqlite/pdo_sqlite.c -o ext/pdo_sqlite/pdo_sqlite.lo 
ext/pdo_sqlite/sqlite_driver.lo: /home/$USER/software/sources/php/php-src/ext/pdo_sqlite/sqlite_driver.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/$USER/software/sources/php/php-src/ext -Iext/pdo_sqlite/ -I/home/$USER/software/sources/php/php-src/ext/pdo_sqlite/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/pdo_sqlite/sqlite_driver.c -o ext/pdo_sqlite/sqlite_driver.lo 
ext/pdo_sqlite/sqlite_statement.lo: /home/$USER/software/sources/php/php-src/ext/pdo_sqlite/sqlite_statement.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/$USER/software/sources/php/php-src/ext -Iext/pdo_sqlite/ -I/home/$USER/software/sources/php/php-src/ext/pdo_sqlite/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/pdo_sqlite/sqlite_statement.c -o ext/pdo_sqlite/sqlite_statement.lo 
ext/phar/util.lo: /home/$USER/software/sources/php/php-src/ext/phar/util.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/phar/ -I/home/$USER/software/sources/php/php-src/ext/phar/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/phar/util.c -o ext/phar/util.lo 
ext/phar/tar.lo: /home/$USER/software/sources/php/php-src/ext/phar/tar.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/phar/ -I/home/$USER/software/sources/php/php-src/ext/phar/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/phar/tar.c -o ext/phar/tar.lo 
ext/phar/zip.lo: /home/$USER/software/sources/php/php-src/ext/phar/zip.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/phar/ -I/home/$USER/software/sources/php/php-src/ext/phar/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/phar/zip.c -o ext/phar/zip.lo 
ext/phar/stream.lo: /home/$USER/software/sources/php/php-src/ext/phar/stream.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/phar/ -I/home/$USER/software/sources/php/php-src/ext/phar/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/phar/stream.c -o ext/phar/stream.lo 
ext/phar/func_interceptors.lo: /home/$USER/software/sources/php/php-src/ext/phar/func_interceptors.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/phar/ -I/home/$USER/software/sources/php/php-src/ext/phar/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/phar/func_interceptors.c -o ext/phar/func_interceptors.lo 
ext/phar/dirstream.lo: /home/$USER/software/sources/php/php-src/ext/phar/dirstream.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/phar/ -I/home/$USER/software/sources/php/php-src/ext/phar/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/phar/dirstream.c -o ext/phar/dirstream.lo 
ext/phar/phar.lo: /home/$USER/software/sources/php/php-src/ext/phar/phar.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/phar/ -I/home/$USER/software/sources/php/php-src/ext/phar/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/phar/phar.c -o ext/phar/phar.lo 
ext/phar/phar_object.lo: /home/$USER/software/sources/php/php-src/ext/phar/phar_object.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/phar/ -I/home/$USER/software/sources/php/php-src/ext/phar/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/phar/phar_object.c -o ext/phar/phar_object.lo 
ext/phar/phar_path_check.lo: /home/$USER/software/sources/php/php-src/ext/phar/phar_path_check.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/phar/ -I/home/$USER/software/sources/php/php-src/ext/phar/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/phar/phar_path_check.c -o ext/phar/phar_path_check.lo 
ext/posix/posix.lo: /home/$USER/software/sources/php/php-src/ext/posix/posix.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/posix/ -I/home/$USER/software/sources/php/php-src/ext/posix/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/posix/posix.c -o ext/posix/posix.lo 
ext/reflection/php_reflection.lo: /home/$USER/software/sources/php/php-src/ext/reflection/php_reflection.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/reflection/ -I/home/$USER/software/sources/php/php-src/ext/reflection/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/reflection/php_reflection.c -o ext/reflection/php_reflection.lo 
ext/session/mod_user_class.lo: /home/$USER/software/sources/php/php-src/ext/session/mod_user_class.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/session/ -I/home/$USER/software/sources/php/php-src/ext/session/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/session/mod_user_class.c -o ext/session/mod_user_class.lo 
ext/session/session.lo: /home/$USER/software/sources/php/php-src/ext/session/session.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/session/ -I/home/$USER/software/sources/php/php-src/ext/session/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/session/session.c -o ext/session/session.lo 
ext/session/mod_files.lo: /home/$USER/software/sources/php/php-src/ext/session/mod_files.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/session/ -I/home/$USER/software/sources/php/php-src/ext/session/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/session/mod_files.c -o ext/session/mod_files.lo 
ext/session/mod_mm.lo: /home/$USER/software/sources/php/php-src/ext/session/mod_mm.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/session/ -I/home/$USER/software/sources/php/php-src/ext/session/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/session/mod_mm.c -o ext/session/mod_mm.lo 
ext/session/mod_user.lo: /home/$USER/software/sources/php/php-src/ext/session/mod_user.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/session/ -I/home/$USER/software/sources/php/php-src/ext/session/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/session/mod_user.c -o ext/session/mod_user.lo 
ext/simplexml/simplexml.lo: /home/$USER/software/sources/php/php-src/ext/simplexml/simplexml.c
	$(LIBTOOL) --mode=compile $(CC)  -Iext/simplexml/ -I/home/$USER/software/sources/php/php-src/ext/simplexml/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/simplexml/simplexml.c -o ext/simplexml/simplexml.lo 
ext/spl/php_spl.lo: /home/$USER/software/sources/php/php-src/ext/spl/php_spl.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/spl/ -I/home/$USER/software/sources/php/php-src/ext/spl/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/spl/php_spl.c -o ext/spl/php_spl.lo 
ext/spl/spl_functions.lo: /home/$USER/software/sources/php/php-src/ext/spl/spl_functions.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/spl/ -I/home/$USER/software/sources/php/php-src/ext/spl/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/spl/spl_functions.c -o ext/spl/spl_functions.lo 
ext/spl/spl_engine.lo: /home/$USER/software/sources/php/php-src/ext/spl/spl_engine.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/spl/ -I/home/$USER/software/sources/php/php-src/ext/spl/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/spl/spl_engine.c -o ext/spl/spl_engine.lo 
ext/spl/spl_iterators.lo: /home/$USER/software/sources/php/php-src/ext/spl/spl_iterators.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/spl/ -I/home/$USER/software/sources/php/php-src/ext/spl/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/spl/spl_iterators.c -o ext/spl/spl_iterators.lo 
ext/spl/spl_array.lo: /home/$USER/software/sources/php/php-src/ext/spl/spl_array.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/spl/ -I/home/$USER/software/sources/php/php-src/ext/spl/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/spl/spl_array.c -o ext/spl/spl_array.lo 
ext/spl/spl_directory.lo: /home/$USER/software/sources/php/php-src/ext/spl/spl_directory.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/spl/ -I/home/$USER/software/sources/php/php-src/ext/spl/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/spl/spl_directory.c -o ext/spl/spl_directory.lo 
ext/spl/spl_exceptions.lo: /home/$USER/software/sources/php/php-src/ext/spl/spl_exceptions.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/spl/ -I/home/$USER/software/sources/php/php-src/ext/spl/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/spl/spl_exceptions.c -o ext/spl/spl_exceptions.lo 
ext/spl/spl_observer.lo: /home/$USER/software/sources/php/php-src/ext/spl/spl_observer.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/spl/ -I/home/$USER/software/sources/php/php-src/ext/spl/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/spl/spl_observer.c -o ext/spl/spl_observer.lo 
ext/spl/spl_dllist.lo: /home/$USER/software/sources/php/php-src/ext/spl/spl_dllist.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/spl/ -I/home/$USER/software/sources/php/php-src/ext/spl/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/spl/spl_dllist.c -o ext/spl/spl_dllist.lo 
ext/spl/spl_heap.lo: /home/$USER/software/sources/php/php-src/ext/spl/spl_heap.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/spl/ -I/home/$USER/software/sources/php/php-src/ext/spl/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/spl/spl_heap.c -o ext/spl/spl_heap.lo 
ext/spl/spl_fixedarray.lo: /home/$USER/software/sources/php/php-src/ext/spl/spl_fixedarray.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/spl/ -I/home/$USER/software/sources/php/php-src/ext/spl/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/spl/spl_fixedarray.c -o ext/spl/spl_fixedarray.lo 
ext/standard/crypt_freesec.lo: /home/$USER/software/sources/php/php-src/ext/standard/crypt_freesec.c
	$(LIBTOOL) --mode=compile $(CC)  -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/crypt_freesec.c -o ext/standard/crypt_freesec.lo 
ext/standard/crypt_blowfish.lo: /home/$USER/software/sources/php/php-src/ext/standard/crypt_blowfish.c
	$(LIBTOOL) --mode=compile $(CC)  -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/crypt_blowfish.c -o ext/standard/crypt_blowfish.lo 
ext/standard/crypt_sha512.lo: /home/$USER/software/sources/php/php-src/ext/standard/crypt_sha512.c
	$(LIBTOOL) --mode=compile $(CC)  -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/crypt_sha512.c -o ext/standard/crypt_sha512.lo 
ext/standard/crypt_sha256.lo: /home/$USER/software/sources/php/php-src/ext/standard/crypt_sha256.c
	$(LIBTOOL) --mode=compile $(CC)  -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/crypt_sha256.c -o ext/standard/crypt_sha256.lo 
ext/standard/php_crypt_r.lo: /home/$USER/software/sources/php/php-src/ext/standard/php_crypt_r.c
	$(LIBTOOL) --mode=compile $(CC)  -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/php_crypt_r.c -o ext/standard/php_crypt_r.lo 
ext/standard/array.lo: /home/$USER/software/sources/php/php-src/ext/standard/array.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/array.c -o ext/standard/array.lo 
ext/standard/base64.lo: /home/$USER/software/sources/php/php-src/ext/standard/base64.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/base64.c -o ext/standard/base64.lo 
ext/standard/basic_functions.lo: /home/$USER/software/sources/php/php-src/ext/standard/basic_functions.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/basic_functions.c -o ext/standard/basic_functions.lo 
ext/standard/browscap.lo: /home/$USER/software/sources/php/php-src/ext/standard/browscap.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/browscap.c -o ext/standard/browscap.lo 
ext/standard/crc32.lo: /home/$USER/software/sources/php/php-src/ext/standard/crc32.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/crc32.c -o ext/standard/crc32.lo 
ext/standard/crypt.lo: /home/$USER/software/sources/php/php-src/ext/standard/crypt.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/crypt.c -o ext/standard/crypt.lo 
ext/standard/datetime.lo: /home/$USER/software/sources/php/php-src/ext/standard/datetime.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/datetime.c -o ext/standard/datetime.lo 
ext/standard/dir.lo: /home/$USER/software/sources/php/php-src/ext/standard/dir.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/dir.c -o ext/standard/dir.lo 
ext/standard/dl.lo: /home/$USER/software/sources/php/php-src/ext/standard/dl.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/dl.c -o ext/standard/dl.lo 
ext/standard/dns.lo: /home/$USER/software/sources/php/php-src/ext/standard/dns.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/dns.c -o ext/standard/dns.lo 
ext/standard/exec.lo: /home/$USER/software/sources/php/php-src/ext/standard/exec.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/exec.c -o ext/standard/exec.lo 
ext/standard/file.lo: /home/$USER/software/sources/php/php-src/ext/standard/file.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/file.c -o ext/standard/file.lo 
ext/standard/filestat.lo: /home/$USER/software/sources/php/php-src/ext/standard/filestat.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/filestat.c -o ext/standard/filestat.lo 
ext/standard/flock_compat.lo: /home/$USER/software/sources/php/php-src/ext/standard/flock_compat.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/flock_compat.c -o ext/standard/flock_compat.lo 
ext/standard/formatted_print.lo: /home/$USER/software/sources/php/php-src/ext/standard/formatted_print.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/formatted_print.c -o ext/standard/formatted_print.lo 
ext/standard/fsock.lo: /home/$USER/software/sources/php/php-src/ext/standard/fsock.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/fsock.c -o ext/standard/fsock.lo 
ext/standard/head.lo: /home/$USER/software/sources/php/php-src/ext/standard/head.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/head.c -o ext/standard/head.lo 
ext/standard/html.lo: /home/$USER/software/sources/php/php-src/ext/standard/html.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/html.c -o ext/standard/html.lo 
ext/standard/image.lo: /home/$USER/software/sources/php/php-src/ext/standard/image.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/image.c -o ext/standard/image.lo 
ext/standard/info.lo: /home/$USER/software/sources/php/php-src/ext/standard/info.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/info.c -o ext/standard/info.lo 
ext/standard/iptc.lo: /home/$USER/software/sources/php/php-src/ext/standard/iptc.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/iptc.c -o ext/standard/iptc.lo 
ext/standard/lcg.lo: /home/$USER/software/sources/php/php-src/ext/standard/lcg.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/lcg.c -o ext/standard/lcg.lo 
ext/standard/link.lo: /home/$USER/software/sources/php/php-src/ext/standard/link.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/link.c -o ext/standard/link.lo 
ext/standard/mail.lo: /home/$USER/software/sources/php/php-src/ext/standard/mail.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/mail.c -o ext/standard/mail.lo 
ext/standard/math.lo: /home/$USER/software/sources/php/php-src/ext/standard/math.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/math.c -o ext/standard/math.lo 
ext/standard/md5.lo: /home/$USER/software/sources/php/php-src/ext/standard/md5.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/md5.c -o ext/standard/md5.lo 
ext/standard/metaphone.lo: /home/$USER/software/sources/php/php-src/ext/standard/metaphone.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/metaphone.c -o ext/standard/metaphone.lo 
ext/standard/microtime.lo: /home/$USER/software/sources/php/php-src/ext/standard/microtime.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/microtime.c -o ext/standard/microtime.lo 
ext/standard/pack.lo: /home/$USER/software/sources/php/php-src/ext/standard/pack.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/pack.c -o ext/standard/pack.lo 
ext/standard/pageinfo.lo: /home/$USER/software/sources/php/php-src/ext/standard/pageinfo.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/pageinfo.c -o ext/standard/pageinfo.lo 
ext/standard/quot_print.lo: /home/$USER/software/sources/php/php-src/ext/standard/quot_print.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/quot_print.c -o ext/standard/quot_print.lo 
ext/standard/rand.lo: /home/$USER/software/sources/php/php-src/ext/standard/rand.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/rand.c -o ext/standard/rand.lo 
ext/standard/mt_rand.lo: /home/$USER/software/sources/php/php-src/ext/standard/mt_rand.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/mt_rand.c -o ext/standard/mt_rand.lo 
ext/standard/soundex.lo: /home/$USER/software/sources/php/php-src/ext/standard/soundex.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/soundex.c -o ext/standard/soundex.lo 
ext/standard/string.lo: /home/$USER/software/sources/php/php-src/ext/standard/string.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/string.c -o ext/standard/string.lo 
ext/standard/scanf.lo: /home/$USER/software/sources/php/php-src/ext/standard/scanf.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/scanf.c -o ext/standard/scanf.lo 
ext/standard/syslog.lo: /home/$USER/software/sources/php/php-src/ext/standard/syslog.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/syslog.c -o ext/standard/syslog.lo 
ext/standard/type.lo: /home/$USER/software/sources/php/php-src/ext/standard/type.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/type.c -o ext/standard/type.lo 
ext/standard/uniqid.lo: /home/$USER/software/sources/php/php-src/ext/standard/uniqid.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/uniqid.c -o ext/standard/uniqid.lo 
ext/standard/url.lo: /home/$USER/software/sources/php/php-src/ext/standard/url.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/url.c -o ext/standard/url.lo 
ext/standard/var.lo: /home/$USER/software/sources/php/php-src/ext/standard/var.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/var.c -o ext/standard/var.lo 
ext/standard/versioning.lo: /home/$USER/software/sources/php/php-src/ext/standard/versioning.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/versioning.c -o ext/standard/versioning.lo 
ext/standard/assert.lo: /home/$USER/software/sources/php/php-src/ext/standard/assert.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/assert.c -o ext/standard/assert.lo 
ext/standard/strnatcmp.lo: /home/$USER/software/sources/php/php-src/ext/standard/strnatcmp.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/strnatcmp.c -o ext/standard/strnatcmp.lo 
ext/standard/levenshtein.lo: /home/$USER/software/sources/php/php-src/ext/standard/levenshtein.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/levenshtein.c -o ext/standard/levenshtein.lo 
ext/standard/incomplete_class.lo: /home/$USER/software/sources/php/php-src/ext/standard/incomplete_class.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/incomplete_class.c -o ext/standard/incomplete_class.lo 
ext/standard/url_scanner_ex.lo: /home/$USER/software/sources/php/php-src/ext/standard/url_scanner_ex.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/url_scanner_ex.c -o ext/standard/url_scanner_ex.lo 
ext/standard/ftp_fopen_wrapper.lo: /home/$USER/software/sources/php/php-src/ext/standard/ftp_fopen_wrapper.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/ftp_fopen_wrapper.c -o ext/standard/ftp_fopen_wrapper.lo 
ext/standard/http_fopen_wrapper.lo: /home/$USER/software/sources/php/php-src/ext/standard/http_fopen_wrapper.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/http_fopen_wrapper.c -o ext/standard/http_fopen_wrapper.lo 
ext/standard/php_fopen_wrapper.lo: /home/$USER/software/sources/php/php-src/ext/standard/php_fopen_wrapper.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/php_fopen_wrapper.c -o ext/standard/php_fopen_wrapper.lo 
ext/standard/credits.lo: /home/$USER/software/sources/php/php-src/ext/standard/credits.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/credits.c -o ext/standard/credits.lo 
ext/standard/css.lo: /home/$USER/software/sources/php/php-src/ext/standard/css.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/css.c -o ext/standard/css.lo 
ext/standard/var_unserializer.lo: /home/$USER/software/sources/php/php-src/ext/standard/var_unserializer.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/var_unserializer.c -o ext/standard/var_unserializer.lo 
ext/standard/ftok.lo: /home/$USER/software/sources/php/php-src/ext/standard/ftok.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/ftok.c -o ext/standard/ftok.lo 
ext/standard/sha1.lo: /home/$USER/software/sources/php/php-src/ext/standard/sha1.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/sha1.c -o ext/standard/sha1.lo 
ext/standard/user_filters.lo: /home/$USER/software/sources/php/php-src/ext/standard/user_filters.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/user_filters.c -o ext/standard/user_filters.lo 
ext/standard/uuencode.lo: /home/$USER/software/sources/php/php-src/ext/standard/uuencode.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/uuencode.c -o ext/standard/uuencode.lo 
ext/standard/filters.lo: /home/$USER/software/sources/php/php-src/ext/standard/filters.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/filters.c -o ext/standard/filters.lo 
ext/standard/proc_open.lo: /home/$USER/software/sources/php/php-src/ext/standard/proc_open.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/proc_open.c -o ext/standard/proc_open.lo 
ext/standard/streamsfuncs.lo: /home/$USER/software/sources/php/php-src/ext/standard/streamsfuncs.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/streamsfuncs.c -o ext/standard/streamsfuncs.lo 
ext/standard/http.lo: /home/$USER/software/sources/php/php-src/ext/standard/http.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/http.c -o ext/standard/http.lo 
ext/standard/password.lo: /home/$USER/software/sources/php/php-src/ext/standard/password.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/password.c -o ext/standard/password.lo 
ext/standard/random.lo: /home/$USER/software/sources/php/php-src/ext/standard/random.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/random.c -o ext/standard/random.lo 
ext/standard/net.lo: /home/$USER/software/sources/php/php-src/ext/standard/net.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/net.c -o ext/standard/net.lo 
ext/standard/hrtime.lo: /home/$USER/software/sources/php/php-src/ext/standard/hrtime.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/standard/ -I/home/$USER/software/sources/php/php-src/ext/standard/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/standard/hrtime.c -o ext/standard/hrtime.lo 
ext/tokenizer/tokenizer.lo: /home/$USER/software/sources/php/php-src/ext/tokenizer/tokenizer.c
	$(LIBTOOL) --mode=compile $(CC)  -Iext/tokenizer/ -I/home/$USER/software/sources/php/php-src/ext/tokenizer/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/tokenizer/tokenizer.c -o ext/tokenizer/tokenizer.lo 
ext/tokenizer/tokenizer_data.lo: /home/$USER/software/sources/php/php-src/ext/tokenizer/tokenizer_data.c
	$(LIBTOOL) --mode=compile $(CC)  -Iext/tokenizer/ -I/home/$USER/software/sources/php/php-src/ext/tokenizer/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/tokenizer/tokenizer_data.c -o ext/tokenizer/tokenizer_data.lo 
ext/xml/xml.lo: /home/$USER/software/sources/php/php-src/ext/xml/xml.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/xml/ -I/home/$USER/software/sources/php/php-src/ext/xml/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/xml/xml.c -o ext/xml/xml.lo 
ext/xml/compat.lo: /home/$USER/software/sources/php/php-src/ext/xml/compat.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Iext/xml/ -I/home/$USER/software/sources/php/php-src/ext/xml/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/xml/compat.c -o ext/xml/compat.lo 
ext/xmlreader/php_xmlreader.lo: /home/$USER/software/sources/php/php-src/ext/xmlreader/php_xmlreader.c
	$(LIBTOOL) --mode=compile $(CC)  -Iext/xmlreader/ -I/home/$USER/software/sources/php/php-src/ext/xmlreader/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/xmlreader/php_xmlreader.c -o ext/xmlreader/php_xmlreader.lo 
ext/xmlwriter/php_xmlwriter.lo: /home/$USER/software/sources/php/php-src/ext/xmlwriter/php_xmlwriter.c
	$(LIBTOOL) --mode=compile $(CC)  -Iext/xmlwriter/ -I/home/$USER/software/sources/php/php-src/ext/xmlwriter/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/xmlwriter/php_xmlwriter.c -o ext/xmlwriter/php_xmlwriter.lo 
ext/zip/php_zip.lo: /home/$USER/software/sources/php/php-src/ext/zip/php_zip.c
	$(LIBTOOL) --mode=compile $(CC)  -Iext/zip/ -I/home/$USER/software/sources/php/php-src/ext/zip/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/zip/php_zip.c -o ext/zip/php_zip.lo 
ext/zip/zip_stream.lo: /home/$USER/software/sources/php/php-src/ext/zip/zip_stream.c
	$(LIBTOOL) --mode=compile $(CC)  -Iext/zip/ -I/home/$USER/software/sources/php/php-src/ext/zip/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/ext/zip/zip_stream.c -o ext/zip/zip_stream.lo 
TSRM/TSRM.lo: /home/$USER/software/sources/php/php-src/TSRM/TSRM.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -ITSRM/ -I/home/$USER/software/sources/php/php-src/TSRM/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/TSRM/TSRM.c -o TSRM/TSRM.lo 
main/main.lo: /home/$USER/software/sources/php/php-src/main/main.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Imain/ -I/home/$USER/software/sources/php/php-src/main/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/main/main.c -o main/main.lo 
main/snprintf.lo: /home/$USER/software/sources/php/php-src/main/snprintf.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Imain/ -I/home/$USER/software/sources/php/php-src/main/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/main/snprintf.c -o main/snprintf.lo 
main/spprintf.lo: /home/$USER/software/sources/php/php-src/main/spprintf.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Imain/ -I/home/$USER/software/sources/php/php-src/main/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/main/spprintf.c -o main/spprintf.lo 
main/fopen_wrappers.lo: /home/$USER/software/sources/php/php-src/main/fopen_wrappers.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Imain/ -I/home/$USER/software/sources/php/php-src/main/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/main/fopen_wrappers.c -o main/fopen_wrappers.lo 
main/alloca.lo: /home/$USER/software/sources/php/php-src/main/alloca.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Imain/ -I/home/$USER/software/sources/php/php-src/main/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/main/alloca.c -o main/alloca.lo 
main/php_scandir.lo: /home/$USER/software/sources/php/php-src/main/php_scandir.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Imain/ -I/home/$USER/software/sources/php/php-src/main/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/main/php_scandir.c -o main/php_scandir.lo 
main/php_ini.lo: /home/$USER/software/sources/php/php-src/main/php_ini.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Imain/ -I/home/$USER/software/sources/php/php-src/main/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/main/php_ini.c -o main/php_ini.lo 
main/SAPI.lo: /home/$USER/software/sources/php/php-src/main/SAPI.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Imain/ -I/home/$USER/software/sources/php/php-src/main/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/main/SAPI.c -o main/SAPI.lo 
main/rfc1867.lo: /home/$USER/software/sources/php/php-src/main/rfc1867.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Imain/ -I/home/$USER/software/sources/php/php-src/main/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/main/rfc1867.c -o main/rfc1867.lo 
main/php_content_types.lo: /home/$USER/software/sources/php/php-src/main/php_content_types.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Imain/ -I/home/$USER/software/sources/php/php-src/main/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/main/php_content_types.c -o main/php_content_types.lo 
main/strlcpy.lo: /home/$USER/software/sources/php/php-src/main/strlcpy.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Imain/ -I/home/$USER/software/sources/php/php-src/main/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/main/strlcpy.c -o main/strlcpy.lo 
main/strlcat.lo: /home/$USER/software/sources/php/php-src/main/strlcat.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Imain/ -I/home/$USER/software/sources/php/php-src/main/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/main/strlcat.c -o main/strlcat.lo 
main/explicit_bzero.lo: /home/$USER/software/sources/php/php-src/main/explicit_bzero.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Imain/ -I/home/$USER/software/sources/php/php-src/main/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/main/explicit_bzero.c -o main/explicit_bzero.lo 
main/reentrancy.lo: /home/$USER/software/sources/php/php-src/main/reentrancy.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Imain/ -I/home/$USER/software/sources/php/php-src/main/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/main/reentrancy.c -o main/reentrancy.lo 
main/php_variables.lo: /home/$USER/software/sources/php/php-src/main/php_variables.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Imain/ -I/home/$USER/software/sources/php/php-src/main/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/main/php_variables.c -o main/php_variables.lo 
main/php_ticks.lo: /home/$USER/software/sources/php/php-src/main/php_ticks.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Imain/ -I/home/$USER/software/sources/php/php-src/main/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/main/php_ticks.c -o main/php_ticks.lo 
main/network.lo: /home/$USER/software/sources/php/php-src/main/network.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Imain/ -I/home/$USER/software/sources/php/php-src/main/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/main/network.c -o main/network.lo 
main/php_open_temporary_file.lo: /home/$USER/software/sources/php/php-src/main/php_open_temporary_file.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Imain/ -I/home/$USER/software/sources/php/php-src/main/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/main/php_open_temporary_file.c -o main/php_open_temporary_file.lo 
main/output.lo: /home/$USER/software/sources/php/php-src/main/output.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Imain/ -I/home/$USER/software/sources/php/php-src/main/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/main/output.c -o main/output.lo 
main/getopt.lo: /home/$USER/software/sources/php/php-src/main/getopt.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Imain/ -I/home/$USER/software/sources/php/php-src/main/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/main/getopt.c -o main/getopt.lo 
main/php_syslog.lo: /home/$USER/software/sources/php/php-src/main/php_syslog.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Imain/ -I/home/$USER/software/sources/php/php-src/main/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/main/php_syslog.c -o main/php_syslog.lo 
main/fastcgi.lo: /home/$USER/software/sources/php/php-src/main/fastcgi.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Imain/ -I/home/$USER/software/sources/php/php-src/main/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/main/fastcgi.c -o main/fastcgi.lo 
main/streams/streams.lo: /home/$USER/software/sources/php/php-src/main/streams/streams.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Imain/streams/ -I/home/$USER/software/sources/php/php-src/main/streams/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/main/streams/streams.c -o main/streams/streams.lo 
main/streams/cast.lo: /home/$USER/software/sources/php/php-src/main/streams/cast.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Imain/streams/ -I/home/$USER/software/sources/php/php-src/main/streams/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/main/streams/cast.c -o main/streams/cast.lo 
main/streams/memory.lo: /home/$USER/software/sources/php/php-src/main/streams/memory.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Imain/streams/ -I/home/$USER/software/sources/php/php-src/main/streams/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/main/streams/memory.c -o main/streams/memory.lo 
main/streams/filter.lo: /home/$USER/software/sources/php/php-src/main/streams/filter.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Imain/streams/ -I/home/$USER/software/sources/php/php-src/main/streams/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/main/streams/filter.c -o main/streams/filter.lo 
main/streams/plain_wrapper.lo: /home/$USER/software/sources/php/php-src/main/streams/plain_wrapper.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Imain/streams/ -I/home/$USER/software/sources/php/php-src/main/streams/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/main/streams/plain_wrapper.c -o main/streams/plain_wrapper.lo 
main/streams/userspace.lo: /home/$USER/software/sources/php/php-src/main/streams/userspace.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Imain/streams/ -I/home/$USER/software/sources/php/php-src/main/streams/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/main/streams/userspace.c -o main/streams/userspace.lo 
main/streams/transports.lo: /home/$USER/software/sources/php/php-src/main/streams/transports.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Imain/streams/ -I/home/$USER/software/sources/php/php-src/main/streams/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/main/streams/transports.c -o main/streams/transports.lo 
main/streams/xp_socket.lo: /home/$USER/software/sources/php/php-src/main/streams/xp_socket.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Imain/streams/ -I/home/$USER/software/sources/php/php-src/main/streams/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/main/streams/xp_socket.c -o main/streams/xp_socket.lo 
main/streams/mmap.lo: /home/$USER/software/sources/php/php-src/main/streams/mmap.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Imain/streams/ -I/home/$USER/software/sources/php/php-src/main/streams/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/main/streams/mmap.c -o main/streams/mmap.lo 
main/streams/glob_wrapper.lo: /home/$USER/software/sources/php/php-src/main/streams/glob_wrapper.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Imain/streams/ -I/home/$USER/software/sources/php/php-src/main/streams/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/main/streams/glob_wrapper.c -o main/streams/glob_wrapper.lo 
main/internal_functions.lo: main/internal_functions.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Imain/ -I/home/$USER/software/sources/php/php-src/main/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c main/internal_functions.c -o main/internal_functions.lo 
main/internal_functions_cli.lo: main/internal_functions_cli.c
	$(LIBTOOL) --mode=compile $(CC) -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -Imain/ -I/home/$USER/software/sources/php/php-src/main/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c main/internal_functions_cli.c -o main/internal_functions_cli.lo 
Zend/zend_language_parser.lo: /home/$USER/software/sources/php/php-src/Zend/zend_language_parser.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_language_parser.c -o Zend/zend_language_parser.lo 
Zend/zend_language_scanner.lo: /home/$USER/software/sources/php/php-src/Zend/zend_language_scanner.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_language_scanner.c -o Zend/zend_language_scanner.lo 
Zend/zend_ini_parser.lo: /home/$USER/software/sources/php/php-src/Zend/zend_ini_parser.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_ini_parser.c -o Zend/zend_ini_parser.lo 
Zend/zend_ini_scanner.lo: /home/$USER/software/sources/php/php-src/Zend/zend_ini_scanner.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_ini_scanner.c -o Zend/zend_ini_scanner.lo 
Zend/zend_alloc.lo: /home/$USER/software/sources/php/php-src/Zend/zend_alloc.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_alloc.c -o Zend/zend_alloc.lo 
Zend/zend_compile.lo: /home/$USER/software/sources/php/php-src/Zend/zend_compile.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_compile.c -o Zend/zend_compile.lo 
Zend/zend_constants.lo: /home/$USER/software/sources/php/php-src/Zend/zend_constants.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_constants.c -o Zend/zend_constants.lo 
Zend/zend_dtrace.lo: /home/$USER/software/sources/php/php-src/Zend/zend_dtrace.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_dtrace.c -o Zend/zend_dtrace.lo 
Zend/zend_execute_API.lo: /home/$USER/software/sources/php/php-src/Zend/zend_execute_API.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_execute_API.c -o Zend/zend_execute_API.lo 
Zend/zend_highlight.lo: /home/$USER/software/sources/php/php-src/Zend/zend_highlight.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_highlight.c -o Zend/zend_highlight.lo 
Zend/zend_llist.lo: /home/$USER/software/sources/php/php-src/Zend/zend_llist.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_llist.c -o Zend/zend_llist.lo 
Zend/zend_vm_opcodes.lo: /home/$USER/software/sources/php/php-src/Zend/zend_vm_opcodes.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_vm_opcodes.c -o Zend/zend_vm_opcodes.lo 
Zend/zend_opcode.lo: /home/$USER/software/sources/php/php-src/Zend/zend_opcode.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_opcode.c -o Zend/zend_opcode.lo 
Zend/zend_operators.lo: /home/$USER/software/sources/php/php-src/Zend/zend_operators.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_operators.c -o Zend/zend_operators.lo 
Zend/zend_ptr_stack.lo: /home/$USER/software/sources/php/php-src/Zend/zend_ptr_stack.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_ptr_stack.c -o Zend/zend_ptr_stack.lo 
Zend/zend_stack.lo: /home/$USER/software/sources/php/php-src/Zend/zend_stack.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_stack.c -o Zend/zend_stack.lo 
Zend/zend_variables.lo: /home/$USER/software/sources/php/php-src/Zend/zend_variables.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_variables.c -o Zend/zend_variables.lo 
Zend/zend.lo: /home/$USER/software/sources/php/php-src/Zend/zend.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend.c -o Zend/zend.lo 
Zend/zend_API.lo: /home/$USER/software/sources/php/php-src/Zend/zend_API.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_API.c -o Zend/zend_API.lo 
Zend/zend_extensions.lo: /home/$USER/software/sources/php/php-src/Zend/zend_extensions.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_extensions.c -o Zend/zend_extensions.lo 
Zend/zend_hash.lo: /home/$USER/software/sources/php/php-src/Zend/zend_hash.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_hash.c -o Zend/zend_hash.lo 
Zend/zend_list.lo: /home/$USER/software/sources/php/php-src/Zend/zend_list.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_list.c -o Zend/zend_list.lo 
Zend/zend_builtin_functions.lo: /home/$USER/software/sources/php/php-src/Zend/zend_builtin_functions.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_builtin_functions.c -o Zend/zend_builtin_functions.lo 
Zend/zend_attributes.lo: /home/$USER/software/sources/php/php-src/Zend/zend_attributes.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_attributes.c -o Zend/zend_attributes.lo 
Zend/zend_execute.lo: /home/$USER/software/sources/php/php-src/Zend/zend_execute.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_execute.c -o Zend/zend_execute.lo 
Zend/zend_ini.lo: /home/$USER/software/sources/php/php-src/Zend/zend_ini.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_ini.c -o Zend/zend_ini.lo 
Zend/zend_sort.lo: /home/$USER/software/sources/php/php-src/Zend/zend_sort.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_sort.c -o Zend/zend_sort.lo 
Zend/zend_multibyte.lo: /home/$USER/software/sources/php/php-src/Zend/zend_multibyte.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_multibyte.c -o Zend/zend_multibyte.lo 
Zend/zend_ts_hash.lo: /home/$USER/software/sources/php/php-src/Zend/zend_ts_hash.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_ts_hash.c -o Zend/zend_ts_hash.lo 
Zend/zend_stream.lo: /home/$USER/software/sources/php/php-src/Zend/zend_stream.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_stream.c -o Zend/zend_stream.lo 
Zend/zend_iterators.lo: /home/$USER/software/sources/php/php-src/Zend/zend_iterators.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_iterators.c -o Zend/zend_iterators.lo 
Zend/zend_interfaces.lo: /home/$USER/software/sources/php/php-src/Zend/zend_interfaces.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_interfaces.c -o Zend/zend_interfaces.lo 
Zend/zend_exceptions.lo: /home/$USER/software/sources/php/php-src/Zend/zend_exceptions.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_exceptions.c -o Zend/zend_exceptions.lo 
Zend/zend_strtod.lo: /home/$USER/software/sources/php/php-src/Zend/zend_strtod.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_strtod.c -o Zend/zend_strtod.lo 
Zend/zend_gc.lo: /home/$USER/software/sources/php/php-src/Zend/zend_gc.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_gc.c -o Zend/zend_gc.lo 
Zend/zend_closures.lo: /home/$USER/software/sources/php/php-src/Zend/zend_closures.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_closures.c -o Zend/zend_closures.lo 
Zend/zend_weakrefs.lo: /home/$USER/software/sources/php/php-src/Zend/zend_weakrefs.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_weakrefs.c -o Zend/zend_weakrefs.lo 
Zend/zend_float.lo: /home/$USER/software/sources/php/php-src/Zend/zend_float.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_float.c -o Zend/zend_float.lo 
Zend/zend_string.lo: /home/$USER/software/sources/php/php-src/Zend/zend_string.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_string.c -o Zend/zend_string.lo 
Zend/zend_signal.lo: /home/$USER/software/sources/php/php-src/Zend/zend_signal.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_signal.c -o Zend/zend_signal.lo 
Zend/zend_generators.lo: /home/$USER/software/sources/php/php-src/Zend/zend_generators.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_generators.c -o Zend/zend_generators.lo 
Zend/zend_virtual_cwd.lo: /home/$USER/software/sources/php/php-src/Zend/zend_virtual_cwd.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_virtual_cwd.c -o Zend/zend_virtual_cwd.lo 
Zend/zend_ast.lo: /home/$USER/software/sources/php/php-src/Zend/zend_ast.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_ast.c -o Zend/zend_ast.lo 
Zend/zend_objects.lo: /home/$USER/software/sources/php/php-src/Zend/zend_objects.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_objects.c -o Zend/zend_objects.lo 
Zend/zend_object_handlers.lo: /home/$USER/software/sources/php/php-src/Zend/zend_object_handlers.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_object_handlers.c -o Zend/zend_object_handlers.lo 
Zend/zend_objects_API.lo: /home/$USER/software/sources/php/php-src/Zend/zend_objects_API.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_objects_API.c -o Zend/zend_objects_API.lo 
Zend/zend_default_classes.lo: /home/$USER/software/sources/php/php-src/Zend/zend_default_classes.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_default_classes.c -o Zend/zend_default_classes.lo 
Zend/zend_inheritance.lo: /home/$USER/software/sources/php/php-src/Zend/zend_inheritance.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_inheritance.c -o Zend/zend_inheritance.lo 
Zend/zend_smart_str.lo: /home/$USER/software/sources/php/php-src/Zend/zend_smart_str.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_smart_str.c -o Zend/zend_smart_str.lo 
Zend/zend_cpuinfo.lo: /home/$USER/software/sources/php/php-src/Zend/zend_cpuinfo.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_cpuinfo.c -o Zend/zend_cpuinfo.lo 
Zend/zend_gdb.lo: /home/$USER/software/sources/php/php-src/Zend/zend_gdb.c
	$(LIBTOOL) --mode=compile $(CC) 	-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -IZend/ -I/home/$USER/software/sources/php/php-src/Zend/ $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) -c /home/$USER/software/sources/php/php-src/Zend/zend_gdb.c -o Zend/zend_gdb.lo 
