project(
  'libalt-repo',
  ['c', 'vala'],
  version: '1.19.16',
  meson_version: '>= 1.0.0',
  license: 'GPL-3.0-or-later',
)

api_version = '1'
glib_min_version = '2.76'

lib_name = 'alt-repo'
project_name = meson.project_name()
gir_name = 'AltRepo'

versioned_name = meson.project_name() + '-' + api_version
versioned_gir_name = gir_name + '-' + api_version

libalt_repo_deps = versioned_name + '.deps'
libalt_repo_header = project_name + '.h'
libalt_repo_vapi = versioned_name + '.vapi'
libalt_repo_gir = versioned_gir_name + '.gir'
libalt_repo_typelib = versioned_gir_name + '.typelib'

pkgconfig = import('pkgconfig')
gnome = import('gnome')

deps_pkgs = [
  'gee-0.8',
  'gio-2.0',
  'libapi-base-1',
]

gee_dep = dependency('gee-0.8')
gio_dep = dependency('gio-2.0')
libapi_base_dep = dependency('libapi-base-1', fallback : ['libapi-base', 'libapi_base_dep'])

libalt_repo_pgconfig_req = [
  gee_dep,
  gio_dep,
]
libalt_repo_dependencies = libalt_repo_pgconfig_req + [libapi_base_dep]

if libapi_base_dep.type_name() == 'pkgconfig'
  libalt_repo_pgconfig_req += libapi_base_dep
endif

gee_girdir = gee_dep.get_variable('datadir') / 'gir-1.0'
gee_vapidir = gee_dep.get_variable('datadir') / 'vala' / 'vapi'

add_project_arguments(
  # GCC14 COMPILE ERROR
  '-Wno-int-conversion',
  language: ['c'],
)

add_project_arguments(
  '--abi-stability',
  '--hide-internal',
  '--target-glib', glib_min_version,
  '--vapidir', meson.current_source_dir(),
  language: ['vala'],
)

subdir('lib')
subdir('tests')

if get_option('documentation')
  subdir('doc')
endif

gnome.post_install()
