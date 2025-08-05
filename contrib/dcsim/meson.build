dcsim_sources = files(
  'dcsim.c',
)

dcsim = shared_module('dcsim',
  dcsim_sources,
  kwargs: contrib_mod_args,
)
contrib_targets += dcsim

install_data(
  'dcsim.control',
  'dcsim--1.0.sql',
  kwargs: contrib_data_args,
)

tests += {
  'name': 'dcsim',
  'sd': meson.current_source_dir(),
  'bd': meson.current_build_dir(),
  'regress': {
    'sql': [
      'dcsim',
    ],
  },
}
