use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'  => 'Tie::CArray',
    'VERSION_FROM' => 'CArray.pm',
    ($] < 5.005 ? () :
      (
		'AUTHOR'	=> 'Reini Urban',
		'ABSTRACT'  => 'Typed, space-efficient, external C Arrays',
      )),
	'PREREQ_PM' => { 'Tie::Array' => 1.00, },

    # POLLUTE is not needed for 5.6

    # additional targets
    'depend' => {

      # update the pod2text textfile from the embedded pod
      'pod'  => "\$(DISTVNAME).txt\n",
      'dist' => "\$(DISTDEFAULT) \$(DISTVNAME).txt\n",
      '$(DISTVNAME).txt' => "\$(VERSION_FROM)\n" .
      	"\tpod2text \$(VERSION_FROM) >\$(DISTVNAME).txt\n",

      # preprocessor only (MSVC => .i file)
      'preonly' => '$(BASEEXT).i' . "\n\t" .
	'$(CC) -P -I$(PERL_INC) $(C_FILES)'."\n",
    }
);