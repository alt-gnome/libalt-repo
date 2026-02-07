project(
  'libalt-repo',
  ['c', 'vala'],
  version: '1.25.3',
  meson_version: '>= 1.0.0',
  license: 'GPL-3.0-or-later',
)

api_version = '1'
glib_min_version = '2.76'

name = 'alt-repo'
gir_name = 'AltRepo'

versioned_name = name + '-' + api_version
versioned_lib_name = meson.project_name() + '-' + api_version
versioned_gir_name = gir_name + '-' + api_version

deps_name = versioned_lib_name + '.deps'
header_name = versioned_lib_name + '.h'
vapi_name = versioned_lib_name + '.vapi'
gir_name = versioned_gir_name + '.gir'
typelib_name = versioned_gir_name + '.typelib'

pkgconfig = import('pkgconfig')
gnome = import('gnome')

deps_pkgs = [
  'gee-0.8',
  'gio-2.0',
  'libapi-base-5',
]

gee_dep = dependency('gee-0.8')
gio_dep = dependency('gio-2.0')
libapi_base_dep = dependency('libapi-base-5', fallback : ['libapi-base', 'lib_dep'])

pkgconfig_requires = [
  gee_dep,
  gio_dep,
]
dependencies = pkgconfig_requires + [libapi_base_dep]

if libapi_base_dep.type_name() == 'pkgconfig'
  pkgconfig_requires += libapi_base_dep
endif

gee_girdir = gee_dep.get_variable('datadir') / 'gir-1.0'

add_project_arguments(
  '-w',
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
