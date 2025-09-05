%define _unpackaged_files_terminate_build 1

%define api_version 1

Name: libalt-repo
Version: 1.19.20
Release: alt1

Summary: ALT Repo API library on Vala
License: GPL-3.0-or-later
Group: Development/C
Url: https://altlinux.space/alt-gnome/libalt-repo
Vcs: https://altlinux.space/alt-gnome/libalt-repo.git

Source0: %name-%version.tar
Patch0: %name-%version-%release.patch

BuildRequires(pre): rpm-macros-meson
BuildRequires: rpm-build-vala
BuildRequires: rpm-build-gir
BuildRequires: meson
BuildRequires: vala
BuildRequires: gobject-introspection-devel
BuildRequires: gir(Gee) = 0.8
BuildRequires: pkgconfig(gee-0.8)
BuildRequires: pkgconfig(gio-2.0)
BuildRequires: pkgconfig(libapi-base-1)

%description
%summary.

%package -n %name%api_version
Summary: ALT Repo API library on Vala
Group: Development/C

%description -n %name%api_version
%summary.

%package devel
Summary: Development files for %name
Group: Development/C

Requires: %name%api_version = %EVR

%description devel
%summary.

%package -n %name%api_version-gir
Summary: Typelib files for %name
Group: System/Libraries

Requires: %name%api_version = %EVR

%description -n %name%api_version-gir
%summary.

%package gir-devel
Summary: Development gir files for %name for various bindings
Group: Development/Other
BuildArch: noarch

Requires: %name%api_version-gir = %EVR

%description gir-devel
%summary.

%prep
%setup

%build
%meson
%meson_build

%install
%meson_install

%check
%meson_test

%files -n %name%api_version
%_libdir/%name-%api_version.so.*

%files devel
%_libdir/%name-%api_version.so
%_includedir/%name-%api_version.h
%_pkgconfigdir/%name-%api_version.pc
%_vapidir/%name-%api_version.vapi
%_vapidir/%name-%api_version.deps
%doc README.md

%files -n %name%api_version-gir
%_typelibdir/%gir_name-%api_version.typelib

%files gir-devel
%_girdir/%gir_name-%api_version.gir

%changelog
* Sat Dec 14 2024 Alexey Volkov <qualimock@altlinux.org> 1.19.20-alt1
- Initial build for ALT
