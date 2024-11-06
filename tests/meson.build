if get_option('run_net_tests')
  test('Test Client',
    executable('client-test',
      sources: ['client-test.vala'] + libalt_repo_sources,
      dependencies: libalt_repo_dependencies,
    )
  )
endif
