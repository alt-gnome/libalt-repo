%define _unpackaged_files_terminate_build 1

%define api_version 1
%define namever %name-%api_version

Name: libalt-repo-vala
Version: 1.19.20
Release: alt1

Summary: ALT Repo API library on Vala
License: GPL-3.0-or-later
Group: Development/Other
Url: https://altlinux.space/alt-gnome/libalt-repo
Vcs: https://altlinux.space/alt-gnome/libalt-repo.git

Source: %name-%version.tar
Patch: %name-%version-%release.patch

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

%package -n %namever
Summary: %{summary %name}
Group: System/Libraries

%description -n %namever
%{description %name}.

%package -n %namever-devel
Group: Development/Other
Summary: Headers files and library symbolic links for %name
Requires: %namever = %EVR

%description -n %namever-devel
%summary.
This package contains headers and libs
required for building programs with %name.

%package -n %namever-gir
Summary: GObject introspection data for %name
Group: System/Libraries
Requires: %namever = %EVR

%description -n %namever-gir
%{summary %api_version-gir}.

%package -n %namever-gir-devel
Summary: GObject introspection devel data for %name
Group: System/Libraries
BuildArch: noarch
Requires: %namever-gir = %EVR
Requires: %namever-devel = %EVR

%description -n %namever-gir-devel
%{summary %api_version-gir-devel}.

%prep
%setup
%autopatch -p1

%build
%meson
%meson_build

%install
%meson_install
%find_lang %name

%files -n %namever
%_libdir/libalt-repo-%api_version.so.*

%files -n %namever-devel
%_includedir/libalt-repo-%api_version.h
%_libdir/libalt-repo-%api_version.so
%_pkgconfigdir/libalt-repo-%api_version.pc
%_datadir/vala/vapi/libalt-repo-%api_version.deps
%_datadir/vala/vapi/libalt-repo-%api_version.vapi

%files -n %namever-gir
%_typelibdir/AltRepo-%api_version.typelib

%files -n %namever-gir-devel
%_girdir/AltRepo-%api_version.gir

%changelog
* Sat Dec 14 2024 Alexey Volkov <qualimock@altlinux.org> 1.19.20-alt1
- Initial build for ALT
