Reading input parameters
Took 0.0074198246002197266 seconds to read inputs
Creating parameter csv
Performing simulations
Took 1614577817.5953887 seconds to perform simulations
ms_gen.py took 29.275880813598633 seconds overall
         178490 function calls in 29.276 seconds

   Ordered by: internal time

   ncalls  tottime  percall  cumtime  percall filename:lineno(function)
     1024   12.707    0.012   12.707    0.012 {method 'read' of '_io.BufferedReader' objects}
    76801    7.693    0.000    7.693    0.000 {method 'writerow' of '_csv.writer' objects}
     1057    4.816    0.005    4.818    0.005 {built-in method io.open}
        1    1.617    1.617   29.276   29.276 ms_gen_profiler.py:11(main)
     1024    0.851    0.001    0.851    0.001 {built-in method posix.read}
     1024    0.554    0.001    0.554    0.001 {built-in method _posixsubprocess.fork_exec}
     2048    0.254    0.000    0.254    0.000 {method 'split' of 'str' objects}
     1024    0.147    0.000    0.174    0.000 {method 'choice' of 'numpy.random.mtrand.RandomState' objects}
     1024    0.117    0.000    1.749    0.002 subprocess.py:1550(_execute_child)
     1024    0.072    0.000    0.176    0.000 subprocess.py:1097(_close_pipe_fds)
     1024    0.036    0.000    0.052    0.000 contextlib.py:429(callback)
     1024    0.032    0.000    1.850    0.002 subprocess.py:732(__init__)
     1024    0.030    0.000    0.033    0.000 contextlib.py:482(__exit__)
     1024    0.024    0.000    0.024    0.000 {method 'decode' of 'bytes' objects}
     1024    0.018    0.000    0.018    0.000 {built-in method posix.waitpid}
     1024    0.017    0.000    0.048    0.000 fromnumeric.py:39(_wrapit)
     1024    0.016    0.000    0.016    0.000 contextlib.py:385(__init__)
     1024    0.015    0.000    0.015    0.000 {method 'close' of '_io.BufferedReader' objects}
     1024    0.015    0.000    0.015    0.000 {built-in method numpy.arange}
     1024    0.015    0.000    0.015    0.000 {built-in method numpy.array}
     1056    0.014    0.000    0.014    0.000 {method 'format' of 'str' objects}
     1024    0.014    0.000   12.776    0.012 subprocess.py:980(communicate)
     2048    0.014    0.000    0.021    0.000 posixpath.py:150(dirname)
     1024    0.012    0.000    0.012    0.000 {method 'repeat' of 'numpy.ndarray' objects}
     1024    0.011    0.000    0.037    0.000 subprocess.py:1772(_wait)
     3072    0.011    0.000    0.011    0.000 {built-in method posix.close}
     2048    0.011    0.000    0.011    0.000 {built-in method posix.pipe}
     2048    0.010    0.000    0.011    0.000 getlimits.py:382(__new__)
     1024    0.009    0.000    0.009    0.000 subprocess.py:935(__del__)
     1024    0.008    0.000    0.057    0.000 fromnumeric.py:52(_wrapfunc)
     1024    0.008    0.000    0.008    0.000 {built-in method builtins.hasattr}
     1024    0.008    0.000    0.015    0.000 numerictypes.py:359(issubdtype)
     1024    0.008    0.000    0.008    0.000 contextlib.py:379(_create_cb_wrapper)
     1024    0.008    0.000    0.064    0.000 fromnumeric.py:437(repeat)
     1024    0.007    0.000    0.075    0.000 <__array_function__ internals>:2(repeat)
     1024    0.004    0.000    0.008    0.000 contextlib.py:463(_push_exit_callback)
     3074    0.004    0.000    0.004    0.000 {built-in method builtins.issubclass}
     1024    0.004    0.000    0.023    0.000 subprocess.py:1759(_try_wait)
     1024    0.004    0.000    0.012    0.000 subprocess.py:1457(_get_handles)
     1024    0.004    0.000    0.004    0.000 {built-in method builtins.sorted}
     1024    0.004    0.000    0.068    0.000 {built-in method numpy.core._multiarray_umath.implement_array_function}
     3081    0.003    0.000    0.003    0.000 {built-in method builtins.getattr}
     1024    0.003    0.000    0.003    0.000 {method 'append' of 'collections.deque' objects}
     1024    0.003    0.000    0.005    0.000 os.py:800(fsencode)
     1024    0.003    0.000    0.003    0.000 subprocess.py:241(_cleanup)
     1024    0.003    0.000    0.040    0.000 subprocess.py:1074(wait)
     2048    0.003    0.000    0.007    0.000 numerictypes.py:285(issubclass_)
     2048    0.003    0.000    0.004    0.000 posixpath.py:41(_get_sep)
     2048    0.002    0.000    0.002    0.000 {method 'rstrip' of 'str' objects}
     1024    0.002    0.000    0.003    0.000 subprocess.py:1706(_handle_exitstatus)
     1024    0.002    0.000    0.004    0.000 random.py:200(randrange)
     5122    0.002    0.000    0.002    0.000 {built-in method builtins.isinstance}
     1024    0.001    0.000    0.001    0.000 {built-in method sys.exc_info}
     1024    0.001    0.000    0.002    0.000 random.py:250(_randbelow_with_getrandbits)
       33    0.001    0.000    0.001    0.000 {built-in method _locale.nl_langinfo}
     1024    0.001    0.000    0.016    0.000 _asarray.py:23(asarray)
     3072    0.001    0.000    0.001    0.000 {built-in method builtins.len}
     1024    0.001    0.000    0.001    0.000 {method 'rfind' of 'str' objects}
     1024    0.001    0.000    0.005    0.000 random.py:244(randint)
     1024    0.001    0.000    0.001    0.000 {method 'encode' of 'str' objects}
        1    0.001    0.001    0.005    0.005 ms_gen_profiler.py:31(<listcomp>)
     2052    0.001    0.000    0.001    0.000 {method 'get' of 'dict' objects}
     1024    0.001    0.000    0.001    0.000 {method 'rfind' of 'bytes' objects}
     1024    0.001    0.000    0.001    0.000 {built-in method _thread.allocate_lock}
     3072    0.001    0.000    0.001    0.000 {built-in method posix.fspath}
     1024    0.001    0.000    0.002    0.000 contextlib.py:381(_exit_wrapper)
        1    0.001    0.001    0.001    0.001 ms_gen_profiler.py:33(<listcomp>)
        1    0.001    0.001    0.001    0.001 ms_gen_profiler.py:32(<listcomp>)
     1024    0.001    0.000    0.001    0.000 {method 'count' of 'list' objects}
     1024    0.001    0.000    0.001    0.000 {method 'rstrip' of 'bytes' objects}
       33    0.001    0.000    0.002    0.000 _bootlocale.py:33(getpreferredencoding)
     1024    0.001    0.000    0.001    0.000 subprocess.py:1724(_internal_poll)
     1024    0.001    0.000    0.001    0.000 {built-in method posix.WIFSIGNALED}
     1024    0.000    0.000    0.000    0.000 contextlib.py:479(__enter__)
     1024    0.000    0.000    0.000    0.000 fromnumeric.py:433(_repeat_dispatcher)
     2048    0.000    0.000    0.000    0.000 {method 'random' of '_random.Random' objects}
     1024    0.000    0.000    0.000    0.000 {built-in method sys.audit}
       33    0.000    0.000    0.000    0.000 codecs.py:186(__init__)
     1024    0.000    0.000    0.000    0.000 {method 'add' of 'set' objects}
       33    0.000    0.000    0.000    0.000 {built-in method _csv.writer}
     1086    0.000    0.000    0.000    0.000 {method 'getrandbits' of '_random.Random' objects}
     1024    0.000    0.000    0.000    0.000 {built-in method posix.WEXITSTATUS}
     1024    0.000    0.000    0.000    0.000 {built-in method posix.WIFEXITED}
     1024    0.000    0.000    0.000    0.000 {method 'pop' of 'collections.deque' objects}
     1024    0.000    0.000    0.000    0.000 {method 'bit_length' of 'int' objects}
        1    0.000    0.000    0.000    0.000 getlimits.py:415(_init)
        1    0.000    0.000    0.000    0.000 {method 'tobytes' of 'numpy.generic' objects}
        1    0.000    0.000    0.000    0.000 getlimits.py:237(_get_machar)
        6    0.000    0.000    0.000    0.000 {built-in method builtins.print}
        1    0.000    0.000    0.000    0.000 numerictypes.py:231(obj2sctype)
        1    0.000    0.000    0.000    0.000 {method 'newbyteorder' of 'numpy.generic' objects}
        9    0.000    0.000    0.000    0.000 {built-in method builtins.setattr}
        1    0.000    0.000    0.000    0.000 ms_gen_profiler.py:18(<listcomp>)
        4    0.000    0.000    0.000    0.000 {built-in method time.time}
        5    0.000    0.000    0.000    0.000 {method 'strip' of 'str' objects}
        1    0.000    0.000    0.000    0.000 {built-in method __new__ of type object at 0x2b705fd96340}
        1    0.000    0.000    0.000    0.000 {method 'append' of 'list' objects}
        1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}


