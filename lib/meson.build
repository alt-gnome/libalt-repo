vapi_sources = files(
  
)

vala_sources = files(
  'objects/api-version.vala',

  'client.vala',
)

libalt_repo_sources = [
  vapi_sources,
  vala_sources,
]

libalt_repo = shared_library(
  'alt-repo',
  libalt_repo_sources,
  dependencies: libalt_repo_dependencies,
  vala_header: libalt_repo_header,
  vala_vapi: libalt_repo_vapi,
  vala_gir: libalt_repo_gir,
  version: meson.project_version(),
  install: true,
  install_dir: [ true, true, true, true ],
)

deps_conf = configuration_data()
deps_conf.set ('DEPS',  '\n'.join (deps_pkgs))

configure_file(
  input: 'libalt-repo.deps.in',
  output: libalt_repo_deps,
  configuration: deps_conf,
  install: true,
  install_dir: get_option('datadir') / 'vala' / 'vapi',
)

if get_option('introspection')
  g_ir_compiler = find_program('g-ir-compiler')
  custom_target(
    'typelib',
    command: [
      g_ir_compiler,
      '--shared-library', '@PLAINNAME@',
      '--output', '@OUTPUT@',
      '--includedir', gee_girdir,
      meson.current_build_dir() / libalt_repo_gir,
    ],
    input: libalt_repo,
    output: libalt_repo_typelib,
    depends: libalt_repo,
    install: true,
    install_dir: get_option('libdir') / 'girepository-1.0',
  )
endif

pkgconfig.generate(
  libalt_repo,
  name: versioned_name,
  requires: libalt_repo_dependencies,
  subdirs: [ versioned_name ],
  description: 'Base objects for API libraries',
  version: meson.project_version(),
  url: 'https://github.com/Rirusha/libalt-repo',
)
