dnl Configury specific to the libfabrics PSM provider

dnl Called to configure this provider
dnl
dnl Arguments:
dnl
dnl $1: action if configured successfully
dnl $2: action if not configured successfully
dnl
AC_DEFUN([FI_PSM_CONFIGURE],[
	# Determine if we can support the psm provider
	psm_happy=0
	AS_IF([test x"$enable_psm" != x"no"],
	      [psm_happy=1
	       AC_CHECK_HEADER([psm.h], [], [psm_happy=0])
	       AC_CHECK_LIB([psm_infinipath], [psm_init], [], [psm_happy=0])])

	AS_IF([test $psm_happy -eq 1], [$1], [$2])
])
