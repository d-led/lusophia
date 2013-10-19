_G.package.path=_G.package.path..[[;./?.lua;./?/?.lua]]
assert ( require 'premake.quickstart' )

make_solution 'lua-sophia'

includedirs { 
	'./sophia/db'
}

make_shared_lib( 'sophia',
	{
		'./sophia/db/*.h',
		'./sophia/db/*.c',
		'./lua-sophia/lua-sophia.c'
	}
)
language "C"
targetprefix ''
targetdir '.'

-- links
configuration 'macosx'
	links { 'lua' }
	targetextension '.so'
configuration 'linux'
	links { 'lua5.1-c++' }
	includedirs { '/usr/include/lua5.1' }
configuration 'windows'
	links { "lua5.1" }
configuration { '*' }
