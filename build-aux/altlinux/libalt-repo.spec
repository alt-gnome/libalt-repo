%define _unpackaged_files_terminate_build 1

%define old_package libalt-repo-vala-1
%define bare_name @BARE_NAME@
%define api_version @LAST_API_VERSION@
%define minor_version @LAST_MINOR_VERSION@
%define gir_name AltRepo-%api_version
%define good_name %bare_name-%api_version

Name: @PACKAGE_NAME@
Version: %api_version.%minor_version
Release: @RELEASE@

Summary: ALT Repo API library on Vala
License: GPL-3.0-or-later
Group: System/Libraries
Url: https://altlinux.space/alt-gnome/libalt-repo
Vcs: https://altlinux.space/alt-gnome/libalt-repo.git

Source0: %name-%version.tar
Patch: %name-%version-%release.patch

Provides: %old_package = %version
Obsoletes: %old_package < %version

BuildRequires(pre): rpm-macros-meson rpm-build-vala rpm-build-gir
BuildRequires: meson
BuildRequires: vala
BuildRequires: pkgconfig(gee-0.8)
BuildRequires: pkgconfig(gio-2.0)
BuildRequires: pkgconfig(libapi-base-2)
BuildRequires: vapi(libapi-base-2)
BuildRequires: gir(Gee) = 0.8
BuildRequires: gobject-introspection-devel

%description
%summary.

%package devel
Summary: Development files for %name
Group: Development/C

# Provides: %bare_name-devel = %version
Provides: %old_package-devel = %version
Obsoletes: %old_package-devel

Requires: %name = %EVR

%description devel
%summary.

%package devel-vala
Summary: Development vapi files for %name
Group: System/Libraries
BuildArch: noarch

Provides: %old_package-devel-vala = %version
Obsoletes: %old_package-devel-vala

Requires: %name-devel = %EVR

%description devel-vala
%summary.

%package gir
Summary: Typelib files for %name
Group: System/Libraries

Provides: %old_package-gir = %version
Obsoletes: %old_package-gir

Requires: %name = %EVR

%description gir
%summary.

%package gir-devel
Summary: Development gir files for %name for various bindings
Group: Development/Other
BuildArch: noarch

Provides: %old_package-gir-devel = %version
Obsoletes: %old_package-gir-devel

Requires: %name-gir = %EVR

%description gir-devel
%summary.

%prep
%setup

%build
%meson -Drun_net_tests=False
%meson_build

%install
%meson_install

%check
%meson_test

%files
%_libdir/%good_name.so.*
%doc README.md

%files devel
%_libdir/%good_name.so
%_includedir/%good_name.h
%_pkgconfigdir/%good_name.pc

%files devel-vala
%_vapidir/%good_name.vapi
%_vapidir/%good_name.deps

%files gir
%_typelibdir/%gir_name.typelib

%files gir-devel
%_girdir/%gir_name.gir
