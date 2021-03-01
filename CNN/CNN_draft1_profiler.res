label shape before reshape: torch.Size([20, 32])
net output shape: torch.Size([640, 5])
label tensor shape: torch.Size([640])
label shape before reshape: torch.Size([12, 32])
net output shape: torch.Size([384, 5])
label tensor shape: torch.Size([384])
label shape before reshape: torch.Size([20, 32])
net output shape: torch.Size([640, 5])
label tensor shape: torch.Size([640])
label shape before reshape: torch.Size([12, 32])
net output shape: torch.Size([384, 5])
label tensor shape: torch.Size([384])
Total time run: 2.4040 minutes
         24560212 function calls (24553691 primitive calls) in 144.242 seconds

   Ordered by: internal time

   ncalls  tottime  percall  cumtime  percall filename:lineno(function)
       65  111.764    1.719  114.965    1.769 {cudf._lib.csv.read_csv}
      271    6.699    0.025    6.699    0.025 {built-in method posix.stat}
      132    4.452    0.034   10.553    0.080 {cudf._lib.copying.gather}
       12    2.790    0.233    2.790    0.233 {method 'uniform_' of 'torch._C._TensorBase' objects}
      129    1.388    0.011    2.621    0.020 {cudf._lib.interop.to_dlpack}
  4947893    1.121    0.000    1.960    0.000 {built-in method builtins.isinstance}
809306/809303    1.074    0.000    1.295    0.000 dtypes.py:222(is_list_dtype)
       64    1.050    0.016  129.461    2.023 msms.py:112(read_file)
   566658    1.022    0.000    2.026    0.000 utils.py:298(__setitem__)
   242849    0.914    0.000    3.558    0.000 column.py:1401(build_column)
   242849    0.905    0.000    0.905    0.000 column.py:48(__init__)
  2358307    0.718    0.000    0.718    0.000 {built-in method builtins.hasattr}
   242841    0.698    0.000    1.977    0.000 buffer.py:83(_init_from_array_like)
   809294    0.683    0.000    0.891    0.000 dtypes.py:233(is_struct_dtype)
809374/809373    0.586    0.000    0.782    0.000 dtypes.py:172(is_categorical_dtype)
   566658    0.565    0.000    3.452    0.000 utils.py:287(__setitem__)
       64    0.560    0.009  130.020    2.032 msms.py:40(__getitem__)
2193772/2191033    0.556    0.000    0.807    0.000 {built-in method builtins.len}
  1214827    0.516    0.000    0.917    0.000 _collections_abc.py:760(__iter__)
  1140269    0.500    0.000    0.504    0.000 {built-in method _abc._abc_instancecheck}
       12    0.483    0.040    0.483    0.040 {built-in method conv2d}
   242845    0.436    0.000    1.340    0.000 numerical.py:23(__init__)
  1213471    0.399    0.000    0.399    0.000 column_accessor.py:47(__getitem__)
   242841    0.383    0.000    0.560    0.000 buffer.py:133(_buffer_data_from_array_interface)
   242841    0.378    0.000    0.535    0.000 buffer.py:145(confirm_1d_contiguous)
   242842    0.351    0.000    3.028    0.000 buffer.py:15(__init__)
  1140269    0.326    0.000    0.829    0.000 abc.py:137(__instancecheck__)
       16    0.286    0.018    0.286    0.018 {method 'cuda' of 'torch._C._TensorBase' objects}
  1131636    0.248    0.000    0.248    0.000 column.py:124(__len__)
     1396    0.237    0.000    3.691    0.003 column_accessor.py:16(__init__)
   245199    0.201    0.000    0.289    0.000 common.py:1733(pandas_dtype)
567059/566801    0.191    0.000    0.906    0.000 column.py:1537(as_column)
        4    0.152    0.038    0.152    0.038 {method 'run_backward' of 'torch._C._EngineBase' objects}
   242845    0.149    0.000    0.149    0.000 {built-in method _functools.reduce}
      132    0.137    0.001    0.602    0.005 frame.py:2135(_copy_categories)
      132    0.130    0.001    0.597    0.005 frame.py:2183(_copy_struct_names)
   242841    0.123    0.000    0.157    0.000 buffer.py:156(get_c_contiguity)
   566206    0.108    0.000    0.108    0.000 {built-in method builtins.iter}
   566203    0.098    0.000    0.101    0.000 {built-in method builtins.next}
   728948    0.096    0.000    0.097    0.000 _collections_abc.py:719(__iter__)
       12    0.074    0.006    0.074    0.006 {built-in method addmm}
   565557    0.061    0.000    0.061    0.000 {method 'values' of 'collections.OrderedDict' objects}
      726    0.057    0.000    0.458    0.001 column_accessor.py:105(columns)
      128    0.050    0.000    0.050    0.000 column_accessor.py:241(<dictcomp>)
      606    0.038    0.000    0.084    0.000 column_accessor.py:101(names)
2071/2069    0.030    0.000    0.030    0.000 {built-in method numpy.array}
      129    0.028    0.000    1.085    0.008 dataframe.py:2433(columns)
 1546/516    0.025    0.000    0.178    0.000 base.py:293(__new__)
      517    0.020    0.000    0.023    0.000 {pandas._libs.lib.infer_dtype}
      129    0.018    0.000    0.018    0.000 {pyarrow.lib.array}
       12    0.017    0.001    0.017    0.001 {built-in method max_pool2d}
        6    0.017    0.003  130.041   21.673 dataloader.py:473(_next_data)
      129    0.013    0.000    0.014    0.000 {built-in method torch._C._from_dlpack}
        4    0.010    0.003    0.010    0.003 {method 'read' of '_io.BufferedReader' objects}
  980/331    0.010    0.000  136.092    0.411 contextlib.py:71(inner)
      129    0.009    0.000    0.017    0.000 {cudf._lib.interop.from_arrow}
      264    0.008    0.000    0.011    0.000 {method '_to_host_scalar' of 'cudf._lib.scalar.DeviceScalar' objects}
    20502    0.008    0.000    0.011    0.000 generic.py:10(_check)
       24    0.007    0.000    0.007    0.000 {built-in method relu}
1954/1692    0.007    0.000    1.269    0.001 dataframe.py:586(__setattr__)
      136    0.006    0.000    0.007    0.000 scalar.py:73(device_value)
      664    0.006    0.000    0.020    0.000 dtypes.py:298(to_cudf_compatible_scalar)
     4931    0.005    0.000    0.008    0.000 base.py:413(find)
     6346    0.005    0.000    0.010    0.000 common.py:1600(_is_dtype_type)
    31869    0.005    0.000    0.006    0.000 {built-in method builtins.getattr}
     4264    0.005    0.000    0.013    0.000 common.py:1460(is_extension_array_dtype)
     1545    0.005    0.000    0.037    0.000 common.py:218(asarray_tuplesafe)
     4717    0.005    0.000    0.017    0.000 base.py:256(is_dtype)
     4197    0.004    0.000    0.010    0.000 <frozen importlib._bootstrap>:1009(_handle_fromlist)
       68    0.004    0.000    0.024    0.000 column.py:2025(arange)
       68    0.004    0.000    0.007    0.000 {cudf._lib.filling.sequence}
     10/1    0.003    0.000    0.290    0.290 module.py:357(_apply)
      128    0.003    0.000    2.504    0.020 indexing.py:453(_get_column_selection)
     3092    0.003    0.000    0.006    0.000 common.py:422(is_timedelta64_dtype)
       12    0.003    0.000    0.003    0.000 {built-in method stack}
     2063    0.003    0.000    0.003    0.000 {method 'extend' of 'list' objects}
     1402    0.003    0.000    0.568    0.000 utils.py:273(__get__)
  608/216    0.003    0.000    0.003    0.000 {built-in method _abc._abc_subclasscheck}
    16289    0.003    0.000    0.003    0.000 {built-in method builtins.issubclass}
     3162    0.003    0.000    0.011    0.000 common.py:530(is_categorical_dtype)
      128    0.003    0.000   14.323    0.112 indexing.py:387(_getitem_tuple_arg)
        4    0.003    0.001    0.003    0.001 {built-in method cat}
      870    0.003    0.000    0.006    0.000 dtypes.py:280(is_scalar)
     1959    0.003    0.000    0.005    0.000 common.py:1565(_get_dtype)
      261    0.003    0.000    1.317    0.005 dataframe.py:112(__init__)
     1159    0.002    0.000    0.012    0.000 common.py:1330(is_bool_dtype)
     2667    0.002    0.000    0.002    0.000 column_accessor.py:44(__iter__)
      128    0.002    0.000    1.324    0.010 frame.py:497(_get_columns_by_index)
      515    0.002    0.000    0.231    0.000 column_accessor.py:128(to_pandas_index)
      129    0.002    0.000    0.002    0.000 {pyarrow.lib.table}
     3095    0.002    0.000    0.010    0.000 common.py:492(is_interval_dtype)
     1549    0.002    0.000    0.007    0.000 dtypes.py:1119(is_dtype)
     3092    0.002    0.000    0.003    0.000 common.py:905(is_datetime64_any_dtype)
     1556    0.002    0.000    0.006    0.000 base.py:5656(maybe_extract_name)
     3095    0.002    0.000    0.010    0.000 common.py:456(is_period_dtype)
     1549    0.002    0.000    0.007    0.000 dtypes.py:906(is_dtype)
      515    0.002    0.000    0.027    0.000 base.py:5726(_maybe_cast_data_without_dtype)
        1    0.002    0.002    0.003    0.003 {built-in method cudf._lib.join.join}
     2327    0.002    0.000    0.002    0.000 column_accessor.py:58(__len__)
      130    0.002    0.000    0.015    0.000 core.py:534(get_fs_token_paths)
      128    0.002    0.000   14.402    0.113 indexing.py:166(__getitem__)
     3245    0.002    0.000    0.003    0.000 common.py:188(<lambda>)
    178/4    0.002    0.000    0.005    0.001 sre_parse.py:469(_parse)
       80    0.002    0.000    0.002    0.000 {method 'view' of 'torch._C._TensorBase' objects}
      131    0.002    0.000    0.004    0.000 index.py:1415(_from_table)
      132    0.002    0.000   11.769    0.089 frame.py:507(_gather)
      521    0.002    0.000    0.002    0.000 _dtype.py:321(_name_get)
      264    0.002    0.000    0.033    0.000 scalar.py:283(_scalar_binop)
      394    0.002    0.000    0.030    0.000 index.py:1559(_data)
     1545    0.002    0.000    0.004    0.000 common.py:1296(is_float_dtype)
      195    0.002    0.000    0.072    0.000 dataframe.py:471(_from_table)
      397    0.002    0.000    0.002    0.000 {method 'astype' of 'numpy.generic' objects}
      516    0.002    0.000    0.002    0.000 base.py:463(_simple_new)
      129    0.001    0.000    0.021    0.000 column.py:345(from_arrow)
      400    0.001    0.000    0.001    0.000 column_accessor.py:120(_clear_cache)
     1648    0.001    0.000    0.002    0.000 _collections_abc.py:680(values)
      456    0.001    0.000    0.002    0.000 index.py:1618(__len__)
     2227    0.001    0.000    0.002    0.000 inference.py:322(is_hashable)
     1064    0.001    0.000    0.004    0.000 common.py:566(is_string_dtype)
      133    0.001    0.000    0.135    0.001 dataframe.py:2483(index)
      264    0.001    0.000    0.003    0.000 tensor.py:933(grad)
     1031    0.001    0.000    0.003    0.000 common.py:750(is_signed_integer_dtype)
     1018    0.001    0.000    0.002    0.000 _collections_abc.py:672(keys)
      650    0.001    0.000    0.002    0.000 column_accessor.py:72(level_names)
      384    0.001    0.000    0.004    0.000 dataframe.py:566(shape)
      130    0.001    0.000    0.002    0.000 posixpath.py:338(normpath)
      664    0.001    0.000    0.015    0.000 scalar.py:15(__init__)
      980    0.001    0.000    0.001    0.000 nvtx.py:85(__exit__)
     3101    0.001    0.000    0.002    0.000 common.py:180(<lambda>)
      784    0.001    0.000    0.003    0.000 common.py:696(is_integer_dtype)
     1030    0.001    0.000    0.003    0.000 common.py:806(is_unsigned_integer_dtype)
      128    0.001    0.000    1.103    0.009 column_accessor.py:221(select_by_index)
      130    0.001    0.000    0.003    0.000 spec.py:46(__call__)
      980    0.001    0.000    0.001    0.000 nvtx.py:81(__enter__)
     2670    0.001    0.000    0.001    0.000 _collections_abc.py:698(__init__)
        4    0.001    0.000    0.001    0.000 {built-in method torch._C._nn.one_hot}
      400    0.001    0.000    0.014    0.000 scalar.py:106(_preprocess_host_value)
    241/4    0.001    0.000    0.002    0.001 sre_compile.py:71(_compile)
      194    0.001    0.000    0.001    0.000 posixpath.py:75(join)
1550/1548    0.001    0.000    0.030    0.000 _asarray.py:14(asarray)
      664    0.001    0.000    0.003    0.000 dtypes.py:152(is_string_dtype)
     1065    0.001    0.000    0.001    0.000 {cudf._lib.scalar._is_null_host_scalar}
     1311    0.001    0.000    0.001    0.000 index.py:1510(name)
        2    0.001    0.000    0.001    0.000 {built-in method marshal.loads}
     1337    0.001    0.000    0.003    0.000 _collections_abc.py:701(__len__)
      515    0.001    0.000    0.005    0.000 base.py:5672(_maybe_cast_with_dtype)
       65    0.001    0.000  121.676    1.872 csv.py:13(read_csv)
       48    0.001    0.000    0.001    0.000 {method 'add_' of 'torch._C._TensorBase' objects}
     3245    0.001    0.000    0.001    0.000 common.py:183(classes_and_not_datetimelike)
     1453    0.001    0.000    0.001    0.000 {built-in method builtins.setattr}
      528    0.001    0.000    0.001    0.000 numeric.py:1816(isscalar)
     3101    0.001    0.000    0.001    0.000 common.py:178(classes)
      515    0.001    0.000    0.002    0.000 column_accessor.py:88(name)
        1    0.001    0.001  144.242  144.242 CNN_draft1.py:17(main)
      270    0.001    0.000    0.004    0.000 index.py:2697(as_index)
     1064    0.001    0.000    0.002    0.000 common.py:1541(_is_dtype)
      130    0.001    0.000    0.006    0.000 local.py:157(make_path_posix)
      130    0.001    0.000    0.002    0.000 utils.py:265(tokenize)
      264    0.001    0.000    0.012    0.000 scalar.py:298(_dispatch_scalar_binop)
       65    0.001    0.000    0.011    0.000 ioutils.py:1043(ensure_single_filepath_or_buffer)
      923    0.001    0.000    0.001    0.000 dataframe.py:2477(index)
       65    0.001    0.000    6.699    0.103 ioutils.py:1090(get_filepath_or_buffer)
      128    0.001    0.000    0.002    0.000 indexing.py:188(_can_downcast_to_series)
      400    0.001    0.000    0.002    0.000 common.py:1223(is_numeric_dtype)
      386    0.001    0.000    0.153    0.000 dataframe.py:2426(columns)
      521    0.001    0.000    0.002    0.000 index.py:1887(_values)
      136    0.001    0.000    0.013    0.000 {cudf._lib.scalar.as_device_scalar}
      130    0.001    0.000    0.001    0.000 base.py:1032(__iter__)
     2227    0.001    0.000    0.001    0.000 {built-in method builtins.hash}
      279    0.001    0.000    0.001    0.000 {method 'match' of 're.Pattern' objects}
      276    0.001    0.000    0.002    0.000 index.py:2782(_setdefault_name)
     1344    0.001    0.000    0.001    0.000 sre_parse.py:164(__getitem__)
      388    0.001    0.000    0.003    0.000 dataframe.py:868(__len__)
      130    0.001    0.000    0.001    0.000 {built-in method posix.getcwd}
      406    0.001    0.000    0.009    0.000 re.py:273(_compile)
      161    0.001    0.000    0.001    0.000 module.py:781(__setattr__)
       69    0.001    0.000    0.001    0.000 index.py:1487(__new__)
      520    0.001    0.000    0.001    0.000 utils.py:281(stringify_path)
        3    0.001    0.000    2.791    0.930 linear.py:74(__init__)
      528    0.001    0.000    0.012    0.000 scalar.py:81(value)
      130    0.001    0.000    0.006    0.000 index.py:374(name)
      195    0.001    0.000    0.007    0.000 genericpath.py:27(isfile)
        1    0.001    0.001    0.001    0.001 {cudf._lib.sort.order_by}
   263/26    0.001    0.000    0.001    0.000 sre_parse.py:174(getwidth)
      130    0.001    0.000    0.004    0.000 posixpath.py:376(abspath)
      128    0.001    0.000    2.622    0.020 dataframe.py:6805(to_dlpack)
      940    0.001    0.000    0.001    0.000 {built-in method __new__ of type object at 0x55f7c85fb8e0}
     3770    0.000    0.000    0.000    0.000 {method 'append' of 'list' objects}
      130    0.000    0.000    0.001    0.000 core.py:310(_un_chain)
      129    0.000    0.000    2.623    0.020 dlpack.py:41(to_dlpack)
        2    0.000    0.000    0.000    0.000 {built-in method io.open}
      130    0.000    0.000    0.001    0.000 registry.py:182(get_filesystem_class)
      796    0.000    0.000    0.000    0.000 common.py:595(condition)
      519    0.000    0.000    0.000    0.000 base.py:544(_reset_identity)
      518    0.000    0.000    0.003    0.000 index.py:1926(__len__)
      130    0.000    0.000    0.000    0.000 {method 'hexdigest' of '_hashlib.HASH' objects}
      132    0.000    0.000    1.200    0.009 frame.py:2208(_postprocess_columns)
     40/4    0.000    0.000    0.586    0.146 module.py:715(_call_impl)
     1387    0.000    0.000    0.000    0.000 {method 'startswith' of 'str' objects}
      130    0.000    0.000    0.000    0.000 {built-in method _hashlib.openssl_sha256}
      130    0.000    0.000    0.007    0.000 local.py:142(_strip_protocol)
      129    0.000    0.000    0.007    0.000 index.py:354(names)
      134    0.000    0.000    0.002    0.000 column_accessor.py:246(set_by_label)
      980    0.000    0.000    0.000    0.000 {nvtx._lib.lib.push_range}
       12    0.000    0.000    0.001    0.000 init.py:271(_calculate_fan_in_and_fan_out)
      872    0.000    0.000    0.000    0.000 sre_parse.py:233(__next)
  608/216    0.000    0.000    0.004    0.000 abc.py:141(__subclasscheck__)
      130    0.000    0.000    0.000    0.000 utils.py:93(update_storage_options)
      324    0.000    0.000    0.001    0.000 overrides.py:1070(has_torch_function)
      264    0.000    0.000    0.000    0.000 column_accessor.py:79(nlevels)
      144    0.000    0.000    0.002    0.000 index.py:367(name)
        4    0.000    0.000    0.000    0.000 {built-in method torch._C._nn.mse_loss}
       36    0.000    0.000    0.000    0.000 {method 'zero_' of 'torch._C._TensorBase' objects}
      260    0.000    0.000    0.001    0.000 posixpath.py:232(expanduser)
      130    0.000    0.000    0.001    0.000 column_accessor.py:54(__delitem__)
        1    0.000    0.000   10.369   10.369 msms.py:23(__init__)
      264    0.000    0.000    0.011    0.000 scalar.py:103(_device_value_to_host)
      660    0.000    0.000    0.000    0.000 overrides.py:1084(<genexpr>)
      521    0.000    0.000    0.000    0.000 _dtype.py:24(_kind_name)
      416    0.000    0.000    0.000    0.000 {built-in method builtins.max}
     49/4    0.000    0.000    0.005    0.001 sre_parse.py:411(_parse_sub)
      521    0.000    0.000    0.000    0.000 _dtype.py:307(_name_includes_bit_suffix)
      522    0.000    0.000    0.000    0.000 {pandas._libs.lib.is_scalar}
       58    0.000    0.000    0.000    0.000 sre_compile.py:276(_optimize_charset)
       66    0.000    0.000    0.022    0.000 index.py:1550(_values)
       64    0.000    0.000    0.000    0.000 msms.py:121(<listcomp>)
        4    0.000    0.000    0.586    0.146 msms.py:94(forward)
      128    0.000    0.000    0.000    0.000 dataframe.py:2329(iloc)
      264    0.000    0.000    0.001    0.000 scalar.py:164(__bool__)
      980    0.000    0.000    0.000    0.000 {nvtx._lib.lib.pop_range}
        3    0.000    0.000    0.002    0.001 conv.py:37(__init__)
        1    0.000    0.000    0.000    0.000 {method '__exit__' of '_io._IOBase' objects}
      419    0.000    0.000    0.000    0.000 {method 'update' of 'dict' objects}
        1    0.000    0.000    0.000    0.000 {built-in method torch._C._cuda_init}
  133/130    0.000    0.000    0.001    0.000 __init__.py:140(_lazy_init)
      260    0.000    0.000    0.001    0.000 re.py:172(match)
       64    0.000    0.000    0.000    0.000 dtypes.py:281(construct_from_string)
      131    0.000    0.000    0.001    0.000 dtypes.py:346(is_list_like)
       65    0.000    0.000    0.000    0.000 enum.py:356(__getitem__)
        1    0.000    0.000    0.000    0.000 {method 'reshape' of 'torch._C._TensorBase' objects}
      129    0.000    0.000    0.000    0.000 base.py:1213(_get_names)
      628    0.000    0.000    0.001    0.000 sre_parse.py:254(get)
      130    0.000    0.000    0.001    0.000 _collections_abc.py:790(pop)
        1    0.000    0.000    2.795    2.795 msms.py:54(__init__)
      264    0.000    0.000    0.000    0.000 sre_parse.py:111(__init__)
        3    0.000    0.000    0.003    0.001 series.py:201(__init__)
      528    0.000    0.000    0.000    0.000 scalar.py:65(_is_host_value_current)
      134    0.000    0.000    0.002    0.000 column_accessor.py:50(__setitem__)
        8    0.000    0.000    0.000    0.000 {method 'to' of 'torch._C._TensorBase' objects}
      132    0.000    0.000    0.019    0.000 scalar.py:213(__lt__)
       19    0.000    0.000    0.000    0.000 __init__.py:381(__getitem__)
       65    0.000    0.000    6.693    0.103 genericpath.py:16(exists)
        4    0.000    0.000  130.021   32.505 fetch.py:44(<listcomp>)
        4    0.000    0.000    0.000    0.000 {built-in method ones_like}
        4    0.000    0.000    0.002    0.001 sgd.py:75(step)
      851    0.000    0.000    0.000    0.000 {built-in method posix.fspath}
      980    0.000    0.000    0.000    0.000 contextlib.py:58(_recreate_cm)
      347    0.000    0.000    0.001    0.000 {built-in method builtins.any}
        1    0.000    0.000    0.000    0.000 {cudf._lib.interop.to_arrow}
      264    0.000    0.000    0.000    0.000 scalar.py:252(_binop_result_dtype_or_error)
      324    0.000    0.000    0.000    0.000 posixpath.py:41(_get_sep)
        1    0.000    0.000    0.000    0.000 {method 'get' of 'cupy.core.core.ndarray' objects}
      129    0.000    0.000    0.002    0.000 __init__.py:127(init)
        3    0.000    0.000    0.000    0.000 {built-in method builtins.__build_class__}
      134    0.000    0.000    0.000    0.000 __init__.py:107(is_initialized)
        1    0.000    0.000    0.023    0.023 indexing.py:17(indices_from_labels)
      636    0.000    0.000    0.000    0.000 {built-in method builtins.min}
        1    0.000    0.000    0.000    0.000 {built-in method cupy.core.core.array}
      128    0.000    0.000    0.000    0.000 {method 'indices' of 'slice' objects}
       12    0.000    0.000    0.000    0.000 {method 't' of 'torch._C._TensorBase' objects}
      138    0.000    0.000    0.000    0.000 {method 'split' of 'str' objects}
      494    0.000    0.000    0.000    0.000 sre_parse.py:249(match)
        1    0.000    0.000    0.001    0.001 column.py:297(to_arrow)
      662    0.000    0.000    0.000    0.000 {method 'get' of 'dict' objects}
        8    0.000    0.000    0.001    0.000 series.py:107(__init__)
        9    0.000    0.000    0.000    0.000 driver.py:298(safe_cuda_api_call)
      146    0.000    0.000    0.008    0.000 re.py:234(compile)
      110    0.000    0.000    0.000    0.000 module.py:765(__getattr__)
      130    0.000    0.000    0.000    0.000 {built-in method torch._C._cuda_isInBadFork}
        1    0.000    0.000    0.001    0.001 {method 'to_pandas' of 'pyarrow.lib._PandasConvertible' objects}
      131    0.000    0.000    0.000    0.000 registry.py:37(__contains__)
      132    0.000    0.000    0.014    0.000 scalar.py:216(__ge__)
      130    0.000    0.000    0.000    0.000 core.py:479(split_protocol)
        4    0.000    0.000    0.002    0.000 optimizer.py:167(zero_grad)
        9    0.000    0.000    0.001    0.000 column.py:994(astype)
      130    0.000    0.000    0.000    0.000 posixpath.py:64(isabs)
        5    0.000    0.000    0.002    0.000 frame.py:477(_get_columns_by_label)
        1    0.000    0.000    0.000    0.000 tokenize.py:443(open)
      259    0.000    0.000    0.000    0.000 base.py:567(__len__)
        1    0.000    0.000    0.000    0.000 {pandas._libs.lib.maybe_convert_objects}
        1    0.000    0.000    0.025    0.025 indexing.py:131(_loc_to_iloc)
      437    0.000    0.000    0.000    0.000 sre_parse.py:160(__len__)
      129    0.000    0.000    0.000    0.000 index.py:347(names)
      9/8    0.000    0.000    0.002    0.000 driver.py:271(__getattr__)
      128    0.000    0.000    0.000    0.000 indexing.py:384(__init__)
       10    0.000    0.000    0.001    0.000 module.py:223(__init__)
        1    0.000    0.000    0.000    0.000 __init__.py:1304(_clear_cache)
       65    0.000    0.000    0.000    0.000 ioutils.py:1039(_is_local_filesystem)
       28    0.000    0.000    0.000    0.000 grad_mode.py:80(__init__)
      387    0.000    0.000    0.000    0.000 base.py:3870(_values)
        1    0.000    0.000    0.000    0.000 dataloader.py:154(__init__)
      148    0.000    0.000    0.000    0.000 {method 'join' of 'str' objects}
     16/4    0.000    0.000    0.004    0.001 collate.py:42(default_collate)
      130    0.000    0.000    0.000    0.000 spec.py:145(_fs_token)
        3    0.000    0.000    0.001    0.000 construction.py:390(sanitize_array)
       10    0.000    0.000    0.000    0.000 functools.py:37(update_wrapper)
       12    0.000    0.000    0.074    0.006 functional.py:1669(linear)
      363    0.000    0.000    0.000    0.000 sre_parse.py:172(append)
       12    0.000    0.000    0.000    0.000 {built-in method _has_compatible_shallow_copy_type}
        1    0.000    0.000    0.000    0.000 driver.py:461(__init__)
       40    0.000    0.000    0.000    0.000 {built-in method torch._C._get_tracing_state}
        5    0.000    0.000    0.004    0.001 dataframe.py:616(__getitem__)
       69    0.000    0.000    0.000    0.000 index.py:1682(dtype)
        2    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:1356(find_spec)
       12    0.000    0.000    0.000    0.000 {built-in method _make_subclass}
        2    0.000    0.000    0.000    0.000 {built-in method empty}
      136    0.000    0.000    0.000    0.000 column_accessor.py:314(_pad_key)
        3    0.000    0.000    0.000    0.000 range.py:86(__new__)
       32    0.000    0.000    0.000    0.000 {method 'size' of 'torch._C._TensorBase' objects}
        6    0.000    0.000    2.791    0.465 init.py:352(kaiming_uniform_)
        2    0.000    0.000    0.005    0.003 column.py:127(to_pandas)
       28    0.000    0.000    0.000    0.000 grad_mode.py:85(__enter__)
      150    0.000    0.000    0.000    0.000 _collections_abc.py:302(__subclasshook__)
      215    0.000    0.000    0.000    0.000 sre_parse.py:286(tell)
       56    0.000    0.000    0.000    0.000 grad_mode.py:166(__init__)
        1    0.000    0.000    0.001    0.001 linecache.py:82(updatecache)
      195    0.000    0.000    0.000    0.000 {built-in method _stat.S_ISREG}
       12    0.000    0.000    0.000    0.000 module.py:294(register_parameter)
        1    0.000    0.000    0.000    0.000 {method 'write' of '_io.TextIOWrapper' objects}
        1    0.000    0.000    0.001    0.001 warnings.py:35(_formatwarnmsg_impl)
        1    0.000    0.000    0.000    0.000 {method 'readlines' of '_io._IOBase' objects}
       21    0.000    0.000    0.000    0.000 numerictypes.py:360(issubdtype)
        3    0.000    0.000    0.001    0.000 conv.py:85(reset_parameters)
       24    0.000    0.000    0.007    0.000 functional.py:1124(relu)
        1    0.000    0.000    0.001    0.001 driver.py:54(make_logger)
       48    0.000    0.000    0.000    0.000 tensor.py:596(__hash__)
        3    0.000    0.000    0.000    0.000 cast.py:1310(maybe_cast_to_datetime)
        2    0.000    0.000    0.001    0.000 <frozen importlib._bootstrap>:882(_find_spec)
        2    0.000    0.000    0.000    0.000 {method 'random_' of 'torch._C._TensorBase' objects}
       18    0.000    0.000    0.008    0.000 tokenize.py:487(_tokenize)
       58    0.000    0.000    0.000    0.000 sre_compile.py:249(_compile_charset)
       42    0.000    0.000    0.000    0.000 numerictypes.py:286(issubclass_)
        3    0.000    0.000    0.000    0.000 range.py:134(_simple_new)
        1    0.000    0.000    0.030    0.030 series.py:915(__getitem__)
      224    0.000    0.000    0.000    0.000 {method 'find' of 'bytearray' objects}
        4    0.000    0.000    0.000    0.000 {method 'unsqueeze' of 'torch._C._TensorBase' objects}
       14    0.000    0.000    0.000    0.000 {pandas._libs.lib.is_list_like}
        4    0.000    0.000    0.000    0.000 string.py:4654(__init__)
      197    0.000    0.000    0.000    0.000 {method 'endswith' of 'str' objects}
        2    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:914(get_data)
        3    0.000    0.000    0.000    0.000 blocks.py:2701(make_block)
      129    0.000    0.000    0.000    0.000 dataframe.py:512(_constructor)
      130    0.000    0.000    0.000    0.000 {method 'encode' of 'str' objects}
        1    0.000    0.000    0.000    0.000 api.py:26(from_cuda_array_interface)
        4    0.000    0.000    0.002    0.001 grad_mode.py:23(decorate_context)
        1    0.000    0.000    0.000    0.000 driver.py:248(_initialize_extras)
        3    0.000    0.000    0.000    0.000 cast.py:1201(maybe_infer_to_datetimelike)
        1    0.000    0.000    0.000    0.000 join.py:443(compute_output_dtypes)
        2    0.000    0.000    0.001    0.001 driver.py:387(__enter__)
        2    0.000    0.000    0.001    0.001 dataframe.py:420(_init_from_dict_like)
        1    0.000    0.000    0.000    0.000 {built-in method posix.listdir}
       28    0.000    0.000    0.000    0.000 grad_mode.py:89(__exit__)
       10    0.000    0.000    0.000    0.000 driver.py:297(_wrap_api_call)
        5    0.000    0.000    0.000    0.000 generic.py:5141(__setattr__)
        1    0.000    0.000    0.003    0.003 column.py:82(data_array_view)
        2    0.000    0.000    0.000    0.000 {method 'item' of 'torch._C._TensorBase' objects}
        3    0.000    0.000    0.000    0.000 base.py:5650(default_index)
       12    0.000    0.000    0.074    0.006 linear.py:92(forward)
        1    0.000    0.000    0.000    0.000 {method 'reduce' of 'numpy.ufunc' objects}
        4    0.000    0.000    0.000    0.000 {built-in method broadcast_tensors}
        1    0.000    0.000    0.000    0.000 __init__.py:59(_check_capability)
       12    0.000    0.000    0.483    0.040 conv.py:414(_conv_forward)
        2    0.000    0.000    0.000    0.000 dataloader.py:401(__init__)
        1    0.000    0.000    0.000    0.000 {built-in method builtins.compile}
        4    0.000    0.000    0.153    0.038 tensor.py:181(backward)
        4    0.000    0.000    0.001    0.000 functional.py:2637(mse_loss)
        6    0.000    0.000    0.000    0.000 sampler.py:225(__iter__)
      324    0.000    0.000    0.000    0.000 {built-in method torch._C._is_torch_function_enabled}
        1    0.000    0.000    0.000    0.000 driver.py:1015(__init__)
        2    0.000    0.000    0.000    0.000 devicearray.py:65(__init__)
        3    0.000    0.000    0.000    0.000 generic.py:195(__init__)
      130    0.000    0.000    0.000    0.000 registry.py:25(__getitem__)
        1    0.000    0.000    0.007    0.007 dataframe.py:3669(sort_values)
        1    0.000    0.000    0.000    0.000 join.py:299(typecast_input_to_libcudf)
      130    0.000    0.000    0.000    0.000 {method 'pop' of 'list' objects}
       19    0.000    0.000    0.000    0.000 __init__.py:374(__getattr__)
        5    0.000    0.000    0.001    0.000 column_accessor.py:198(select_by_label)
       56    0.000    0.000    0.000    0.000 sre_parse.py:408(_uniq)
       12    0.000    0.000    0.000    0.000 {built-in method torch._C._log_api_usage_once}
      3/2    0.000    0.000    0.003    0.001 <frozen importlib._bootstrap>:978(_find_and_load)
       12    0.000    0.000    0.017    0.001 pooling.py:152(forward)
        1    0.000    0.000    0.000    0.000 {built-in method pickle5._pickle.load}
       12    0.000    0.000    0.000    0.000 module.py:361(compute_should_use_set_data)
        1    0.000    0.000    0.000    0.000 join.py:498(typecast_libcudf_to_output)
      131    0.000    0.000    0.000    0.000 {built-in method posix.getpid}
      352    0.000    0.000    0.000    0.000 {built-in method builtins.ord}
        1    0.000    0.000    0.000    0.000 join.py:2(<module>)
    19/18    0.000    0.000    0.000    0.000 dataloader.py:329(__setattr__)
        1    0.000    0.000    0.001    0.001 devices.py:144(_get_or_create_context_uncached)
        3    0.000    0.000    0.000    0.000 blocks.py:2655(get_block_type)
        3    0.000    0.000    0.006    0.002 column.py:825(take)
        1    0.000    0.000    0.012    0.012 dataframe.py:3973(merge)
        2    0.000    0.000    0.001    0.001 <frozen importlib._bootstrap_external>:793(get_code)
        6    0.000    0.000    0.000    0.000 init.py:67(calculate_gain)
        2    0.000    0.000    2.794    1.397 container.py:217(extend)
        1    0.000    0.000    0.000    0.000 driver.py:339(get_device)
        3    0.000    0.000    0.001    0.000 managers.py:1564(from_array)
       10    0.000    0.000    0.000    0.000 _collections_abc.py:72(_check_methods)
        1    0.000    0.000    0.000    0.000 optimizer.py:207(add_param_group)
        2    0.000    0.000    0.000    0.000 dummyarray.py:159(__init__)
      129    0.000    0.000    0.000    0.000 base.py:1175(name)
      130    0.000    0.000    0.000    0.000 spec.py:48(<genexpr>)
       13    0.000    0.000    0.000    0.000 {built-in method builtins.print}
       36    0.000    0.000    0.000    0.000 {method 'dim' of 'torch._C._TensorBase' objects}
        1    0.000    0.000    0.000    0.000 tokenize.py:350(detect_encoding)
        3    0.000    0.000    0.000    0.000 blocks.py:124(__init__)
      130    0.000    0.000    0.000    0.000 spec.py:180(_get_kwargs_from_urls)
        2    0.000    0.000    0.002    0.001 devices.py:110(ensure_context)
        4    0.000    0.000    0.000    0.000 series.py:398(_set_axis)
        4    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:157(_get_module_lock)
    35/11    0.000    0.000    0.000    0.000 module.py:1222(named_modules)
        3    0.000    0.000    0.000    0.000 index.py:1866(_initialize)
       14    0.000    0.000    0.000    0.000 series.py:214(_column)
       56    0.000    0.000    0.000    0.000 {built-in method fromkeys}
        1    0.000    0.000    0.019    0.019 npyio.py:283(load)
        3    0.000    0.000    2.791    0.930 linear.py:85(reset_parameters)
       19    0.000    0.000    0.000    0.000 module.py:1175(named_children)
        1    0.000    0.000    0.003    0.003 devices.py:221(_require_cuda_context)
        9    0.000    0.000    0.000    0.000 sre_compile.py:413(<listcomp>)
       15    0.000    0.000    0.001    0.000 utils.py:8(parse)
        3    0.000    0.000    0.003    0.001 conv.py:394(__init__)
        1    0.000    0.000    0.001    0.001 join.py:194(validate_merge_cfg)
        1    0.000    0.000    0.000    0.000 __init__.py:1216(getLogger)
       12    0.000    0.000    0.483    0.040 conv.py:422(forward)
        1    0.000    0.000    0.000    0.000 numpy_.py:162(__init__)
        2    0.000    0.000    0.000    0.000 dataframe.py:2964(insert)
        1    0.000    0.000    0.007    0.007 join.py:101(perform_merge)
      137    0.000    0.000    0.000    0.000 {method 'pop' of 'dict' objects}
       36    0.000    0.000    0.000    0.000 {method 'requires_grad_' of 'torch._C._TensorBase' objects}
      105    0.000    0.000    0.000    0.000 _collections_abc.py:392(__subclasshook__)
       13    0.000    0.000    0.000    0.000 module.py:1055(_named_members)
       12    0.000    0.000    0.017    0.001 functional.py:574(_max_pool2d)
       10    0.000    0.000    0.000    0.000 driver.py:305(_find_api)
        4    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:271(cache_from_source)
       65    0.000    0.000    0.000    0.000 sre_compile.py:423(_simple)
        4    0.000    0.000    0.003    0.001 msms.py:86(<genexpr>)
        1    0.000    0.000    0.000    0.000 __init__.py:85(_check_cubins)
        1    0.000    0.000    0.000    0.000 __init__.py:1267(_fixupParents)
       18    0.000    0.000    0.000    0.000 series.py:366(name)
       84    0.000    0.000    0.000    0.000 {built-in method torch._C.is_grad_enabled}
      2/1    0.000    0.000    0.002    0.002 <frozen importlib._bootstrap>:948(_find_and_load_unlocked)
        4    0.000    0.000    0.000    0.000 column_accessor.py:266(_select_by_label_grouped)
        4    0.000    0.000    0.000    0.000 column.py:76(as_frame)
       69    0.000    0.000    0.000    0.000 index.py:91(__init__)
        1    0.000    0.000    0.000    0.000 series.py:2142(loc)
        3    0.000    0.000    0.000    0.000 blocks.py:237(mgr_locs)
        3    0.000    0.000    0.006    0.002 column.py:591(__getitem__)
        1    0.000    0.000    0.000    0.000 numeric.py:268(full)
        4    0.000    0.000    0.000    0.000 typing.py:814(__new__)
        4    0.000    0.000    0.000    0.000 functional.py:42(broadcast_tensors)
        4    0.000    0.000    0.000    0.000 __init__.py:28(_make_grads)
        4    0.000    0.000    0.153    0.038 __init__.py:68(backward)
        4    0.000    0.000  130.024   32.506 fetch.py:42(fetch)
        1    0.000    0.000    0.001    0.001 frame.py:2527(_get_sorted_inds)
        1    0.000    0.000    0.010    0.010 frame.py:3173(_merge)
        1    0.000    0.000    0.000    0.000 join.py:128(preprocess_merge_params)
        3    0.000    0.000    0.000    0.000 __init__.py:295(get_device_properties)
       12    0.000    0.000    0.017    0.001 _jit_internal.py:257(fn)
        2    0.000    0.000    0.000    0.000 cast.py:1187(maybe_castable)
        1    0.000    0.000    0.000    0.000 cast.py:1570(construct_1d_object_array_from_listlike)
        1    0.000    0.000    0.030    0.030 indexing.py:116(__getitem__)
       13    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:56(_path_join)
        1    0.000    0.000    0.000    0.000 tokenize.py:238(untokenize)
        1    0.000    0.000    0.008    0.008 format.py:558(_read_array_header)
       84    0.000    0.000    0.000    0.000 _jit_internal.py:750(is_scripting)
        1    0.000    0.000    0.001    0.001 driver.py:231(initialize)
        1    0.000    0.000    0.000    0.000 cast.py:88(maybe_convert_platform)
        1    0.000    0.000    0.003    0.003 series.py:2240(argsort)
        2    0.000    0.000    0.001    0.000 <frozen importlib._bootstrap_external>:1240(_get_spec)
        1    0.000    0.000    0.001    0.001 warnings.py:20(_showwarnmsg_impl)
       24    0.000    0.000    0.000    0.000 sre_parse.py:343(_escape)
        8    0.000    0.000    0.000    0.000 column.py:506(copy)
        1    0.000    0.000    0.012    0.012 dataframe.py:4097(join)
        2    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:504(_init_module_attrs)
        4    0.000    0.000    0.008    0.002 sre_compile.py:759(compile)
        2    0.000    0.000    0.000    0.000 {built-in method numpy.empty}
        6    0.000    0.000  130.041   21.673 dataloader.py:432(__next__)
        2    0.000    0.000    0.000    0.000 dummyarray.py:149(from_desc)
        1    0.000    0.000    0.000    0.000 column_accessor.py:259(_select_by_label_list_like)
        2    0.000    0.000    0.001    0.001 dataframe.py:2935(copy)
        1    0.000    0.000    0.000    0.000 index.py:1891(copy)
        3    0.000    0.000    0.001    0.000 index.py:2058(__new__)
       10    0.000    0.000    0.000    0.000 {built-in method builtins.all}
        2    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:574(spec_from_file_location)
        3    0.000    0.000    0.000    0.000 _utils.py:8(_get_device_index)
        1    0.000    0.000    0.000    0.000 optimizer.py:33(__init__)
        9    0.000    0.000    0.000    0.000 numerical.py:175(as_numerical_column)
        6    0.000    0.000    0.000    0.000 frame.py:202(__len__)
       17    0.000    0.000    0.000    0.000 {method 'clear' of 'dict' objects}
        1    0.000    0.000    0.001    0.001 linecache.py:37(getlines)
        6    0.000    0.000    0.000    0.000 init.py:342(_calculate_correct_fan)
        4    0.000    0.000    0.003    0.001 collate.py:83(<listcomp>)
        5    0.000    0.000    0.000    0.000 generic.py:5123(__getattr__)
        2    0.000    0.000    0.000    0.000 column_accessor.py:182(copy)
        1    0.000    0.000    0.002    0.002 series.py:4192(to_dlpack)
        3    0.000    0.000    0.000    0.000 {built-in method torch.cuda._get_device_properties}
        4    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:78(acquire)
      2/1    0.000    0.000    0.002    0.002 <frozen importlib._bootstrap>:663(_load_unlocked)
        6    0.000    0.000    0.000    0.000 init.py:12(_no_grad_uniform_)
       10    0.000    0.000    0.000    0.000 common.py:194(is_object_dtype)
        2    0.000    0.000    0.000    0.000 blocks.py:2374(__init__)
        1    0.000    0.000    0.008    0.008 format.py:523(_filter_header)
       12    0.000    0.000    0.000    0.000 parameter.py:23(__new__)
        3    0.000    0.000    0.000    0.000 managers.py:1532(__init__)
        2    0.000    0.000    0.000    0.000 column_accessor.py:145(insert)
        1    0.000    0.000    0.003    0.003 column.py:983(sort_by_values)
        6    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:51(_r_long)
       13    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:58(<listcomp>)
        4    0.000    0.000    0.000    0.000 sre_compile.py:536(_compile_info)
       22    0.000    0.000    0.000    0.000 sre_parse.py:84(opengroup)
        1    0.000    0.000    0.000    0.000 __init__.py:1928(getLogger)
        3    0.000    0.000    0.000    0.000 common.py:224(is_sparse)
        4    0.000    0.000    0.000    0.000 managers.py:1602(dtype)
        3    0.000    0.000    0.000    0.000 frame.py:533(_as_column)
        3    0.000    0.000    0.000    0.000 series.py:395(_copy_construct)
        4    0.000    0.000    0.000    0.000 {built-in method _sre.compile}
       20    0.000    0.000    0.000    0.000 {method 'format' of 'str' objects}
       10    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:74(_path_stat)
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:1190(_path_hooks)
        9    0.000    0.000    0.000    0.000 sre_compile.py:411(_mk_bitmap)
        1    0.000    0.000    0.000    0.000 sgd.py:55(__init__)
       64    0.000    0.000    0.000    0.000 collate.py:80(<genexpr>)
        2    0.000    0.000    0.000    0.000 dummyarray.py:169(_compute_layout)
        1    0.000    0.000    0.000    0.000 from_data.py:44(asarray)
        2    0.000    0.000    0.000    0.000 construction.py:520(_try_cast)
        2    0.000    0.000    0.000    0.000 __init__.py:73(CFUNCTYPE)
        3    0.000    0.000    0.000    0.000 _utils.py:461(_get_device_index)
        6    0.000    0.000    0.000    0.000 __init__.py:46(is_available)
       19    0.000    0.000    0.000    0.000 module.py:1166(children)
        1    0.000    0.000    0.000    0.000 __init__.py:1336(__init__)
        2    0.000    0.000    0.000    0.000 {pandas._libs.lib.infer_datetimelike_array}
        1    0.000    0.000    0.000    0.000 {cudf._lib.join.compute_result_col_names}
        1    0.000    0.000    0.001    0.001 join.py:15(__init__)
        2    0.000    0.000    0.000    0.000 {method 'read' of '_io.FileIO' objects}
        1    0.000    0.000    0.000    0.000 codecs.py:309(__init__)
        3    0.000    0.000    0.000    0.000 codecs.py:319(decode)
        1    0.000    0.000    0.000    0.000 warnings.py:415(__init__)
        2    0.000    0.000    0.000    0.000 __init__.py:278(get_device_capability)
        3    0.000    0.000    0.000    0.000 utils.py:20(_reverse_repeat_tuple)
        6    0.000    0.000    0.000    0.000 __init__.py:212(_acquireLock)
       10    0.000    0.000    0.000    0.000 __init__.py:1614(isEnabledFor)
        1    0.000    0.000    0.000    0.000 driver.py:524(get_primary_context)
        6    0.000    0.000    0.000    0.000 series.py:442(name)
        1    0.000    0.000    0.000    0.000 index.py:1574(copy)
        2    0.000    0.000    0.000    0.000 _dtype.py:34(__str__)
        1    0.000    0.000    0.000    0.000 __init__.py:96(<listcomp>)
        6    0.000    0.000    0.000    0.000 module.py:333(add_module)
        2    0.000    0.000    2.795    1.397 container.py:145(__init__)
        8    0.000    0.000    0.000    0.000 container.py:184(__iter__)
        1    0.000    0.000    0.003    0.003 api.py:56(as_cuda_array)
        2    0.000    0.000    0.000    0.000 devicearray.py:118(__cuda_array_interface__)
        2    0.000    0.000    0.000    0.000 dummyarray.py:193(_compute_extent)
        1    0.000    0.000    0.000    0.000 numeric.py:50(__new__)
        1    0.000    0.000    0.003    0.003 series.py:2343(_sort)
        5    0.000    0.000    0.000    0.000 _collections_abc.py:252(__subclasshook__)
       66    0.000    0.000    0.000    0.000 sre_parse.py:168(__setitem__)
        3    0.000    0.000    0.000    0.000 base.py:1182(name)
        4    0.000    0.000    0.000    0.000 string.py:4784(set_base_children)
        2    0.000    0.000    0.000    0.000 dataframe.py:483(_align_input_series_indices)
        1    0.000    0.000    0.005    0.005 indexing.py:72(__getitem__)
        4    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:58(__init__)
        1    0.000    0.000    0.000    0.000 contextlib.py:81(__init__)
        5    0.000    0.000    0.000    0.000 __init__.py:338(device_count)
       12    0.000    0.000    0.286    0.024 module.py:463(<lambda>)
        1    0.000    0.000    0.001    0.001 graph_module.py:24(patched_getline)
        1    0.000    0.000    0.000    0.000 {method 'chunk' of 'pyarrow.lib.ChunkedArray' objects}
        1    0.000    0.000    0.004    0.004 dataframe.py:2897(take)
        1    0.000    0.000    0.000    0.000 series.py:1784(null_count)
        2    0.000    0.000    0.000    0.000 {method 'readline' of '_io.BufferedReader' objects}
      2/1    0.000    0.000    0.002    0.002 <frozen importlib._bootstrap_external>:722(exec_module)
       52    0.000    0.000    0.000    0.000 sre_parse.py:81(groups)
        2    0.000    0.000    0.000    0.000 tokenize.py:380(find_cookie)
        1    0.000    0.000    0.000    0.000 pooling.py:17(__init__)
        2    0.000    0.000    0.000    0.000 dataloader.py:465(__init__)
        2    0.000    0.000    0.000    0.000 column_accessor.py:94(nrows)
        3    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:147(__enter__)
       10    0.000    0.000    0.000    0.000 functools.py:67(wraps)
        4    0.000    0.000    0.000    0.000 enum.py:841(__and__)
       15    0.000    0.000    0.000    0.000 module.py:782(remove_from)
        3    0.000    0.000    0.000    0.000 inference.py:263(is_dict_like)
        1    0.000    0.000    0.004    0.004 index.py:582(to_pandas)
        2    0.000    0.000    0.001    0.000 <frozen importlib._bootstrap_external>:523(_compile_bytecode)
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:1319(__init__)
        4    0.000    0.000    0.000    0.000 _collections_abc.py:664(__contains__)
        1    0.000    0.000    0.000    0.000 contextlib.py:237(helper)
        1    0.000    0.000    0.000    0.000 msms.py:31(<listcomp>)
       22    0.000    0.000    0.001    0.000 sre_parse.py:96(closegroup)
        4    0.000    0.000    0.005    0.001 sre_parse.py:913(parse)
        1    0.000    0.000    0.002    0.002 index.py:1621(__getitem__)
        1    0.000    0.000    0.000    0.000 {built-in method torch._C._cuda_getArchFlags}
        4    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:103(release)
        6    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:84(_path_is_mode_type)
        4    0.000    0.000    2.791    0.698 msms.py:89(<genexpr>)
       12    0.000    0.000    0.000    0.000 functional.py:1686(<listcomp>)
        1    0.000    0.000    0.000    0.000 driver.py:2254(memory_size_from_info)
        1    0.000    0.000    0.001    0.001 devices.py:21(__getattr__)
        1    0.000    0.000    0.000    0.000 __init__.py:766(asnumpy)
        6    0.000    0.000    0.000    0.000 common.py:150(ensure_python_int)
        1    0.000    0.000    0.003    0.003 column.py:152(values)
        3    0.000    0.000    0.000    0.000 frame.py:40(_from_table)
        3    0.000    0.000    0.000    0.000 series.py:392(_copy_construct_defaults)
       30    0.000    0.000    0.000    0.000 {built-in method math.sqrt}
        2    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:438(_classify_pyc)
        2    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:1351(_get_spec)
      7/1    0.000    0.000    0.000    0.000 ast.py:64(_convert)
        1    0.000    0.000    0.000    0.000 __init__.py:802(__init__)
        1    0.000    0.000    0.000    0.000 driver.py:2174(get_devptr_for_active_ctx)
        1    0.000    0.000    0.000    0.000 indexing.py:113(__init__)
        4    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:176(cb)
        2    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:1203(_path_importer_cache)
        1    0.000    0.000    0.001    0.001 warnings.py:96(_showwarnmsg)
        2    0.000    0.000    0.000    0.000 {built-in method numpy.core._multiarray_umath.implement_array_function}
       15    0.000    0.000    0.000    0.000 utils.py:26(<genexpr>)
        3    0.000    0.000    0.000    0.000 common.py:190(all_none)
       50    0.000    0.000    0.000    0.000 {method 'items' of 'collections.OrderedDict' objects}
        4    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:403(cached)
        2    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:576(module_from_spec)
        5    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:93(_path_isfile)
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:1404(_fill_cache)
        7    0.000    0.000    0.000    0.000 _collections_abc.py:742(__iter__)
       16    0.000    0.000    0.000    0.000 types.py:164(__get__)
       22    0.000    0.000    0.000    0.000 sre_compile.py:65(_combine_flags)
        1    0.000    0.000    0.000    0.000 <__array_function__ internals>:2(copyto)
        1    0.000    0.000    0.001    0.001 linecache.py:15(getline)
        3    0.000    0.000    0.000    0.000 __init__.py:1170(append)
        6    0.000    0.000    0.000    0.000 init.py:109(uniform_)
        2    0.000    0.000    0.000    0.000 dataloader.py:45(create_fetcher)
        9    0.000    0.000    0.000    0.000 driver.py:326(_check_error)
        2    0.000    0.000    0.000    0.000 driver.py:372(get_active_context)
        1    0.000    0.000    0.000    0.000 syncdetect.py:23(_is_allowed)
        4    0.000    0.000    0.000    0.000 series.py:492(name)
        1    0.000    0.000    0.000    0.000 blocks.py:207(array_values)
        4    0.000    0.000    0.000    0.000 dataframe.py:516(_constructor_sliced)
        2    0.000    0.000    0.000    0.000 series.py:782(__len__)
        1    0.000    0.000    0.006    0.006 series.py:2062(to_pandas)
        1    0.000    0.000    0.000    0.000 join.py:454(<dictcomp>)
       56    0.000    0.000    0.000    0.000 {built-in method torch._C._set_grad_enabled}
        2    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:318(__exit__)
        1    0.000    0.000    0.000    0.000 __init__.py:1548(hasHandlers)
        1    0.000    0.000    0.000    0.000 utils.py:325(__setitem__)
        3    0.000    0.000    0.000    0.000 construction.py:580(is_empty_data)
        1    0.000    0.000    0.000    0.000 base.py:743(to_numpy)
        1    0.000    0.000    0.000    0.000 numpy_.py:50(__init__)
        1    0.000    0.000    0.000    0.000 numpy_.py:210(__array__)
        1    0.000    0.000    0.000    0.000 managers.py:220(set_axis)
       30    0.000    0.000    0.000    0.000 {method 'rstrip' of 'str' objects}
       10    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:222(_verbose_message)
        2    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:369(_get_cached)
        1    0.000    0.000    0.001    0.001 warnings.py:117(_formatwarnmsg)
        1    0.000    0.000    0.000    0.000 contextlib.py:481(__exit__)
        1    0.000    0.000    0.000    0.000 fromnumeric.py:70(_wrapreduction)
       16    0.000    0.000    0.007    0.000 tokenize.py:147(_compile)
       16    0.000    0.000    0.000    0.000 tokenize.py:225(add_whitespace)
        6    0.000    0.000    0.000    0.000 __init__.py:221(_releaseLock)
        1    0.000    0.000    0.000    0.000 __init__.py:783(_addHandlerRef)
        9    0.000    0.000    0.000    0.000 __init__.py:1356(debug)
        2    0.000    0.000    0.000    0.000 driver.py:934(__init__)
        1    0.000    0.000    0.000    0.000 devices.py:27(<listcomp>)
        4    0.000    0.000    0.000    0.000 dummyarray.py:109(compute_index)
       11    0.000    0.000    0.000    0.000 inference.py:289(<genexpr>)
        3    0.000    0.000    0.000    0.000 construction.py:339(extract_array)
        7    0.000    0.000    0.000    0.000 range.py:687(__len__)
        4    0.000    0.000    0.000    0.000 string.py:4772(set_base_data)
        2    0.000    0.000    0.000    0.000 join.py:527(_build_output_col)
        4    0.000    0.000    0.000    0.000 {built-in method builtins.sum}
       15    0.000    0.000    0.000    0.000 {method 'rpartition' of 'str' objects}
       31    0.000    0.000    0.000    0.000 {method 'add' of 'set' objects}
       10    0.000    0.000    0.000    0.000 {method 'numel' of 'torch._C._TensorBase' objects}
        6    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:855(__enter__)
        2    0.000    0.000    0.001    0.000 <frozen importlib._bootstrap_external>:1272(find_spec)
        4    0.000    0.000    0.002    0.001 sre_compile.py:598(_code)
        1    0.000    0.000    0.000    0.000 driver.py:699(__init__)
        1    0.000    0.000    0.000    0.000 driver.py:1562(__init__)
        1    0.000    0.000    0.000    0.000 api.py:201(_prepare_shape_strides_dtype)
        4    0.000    0.000    0.000    0.000 devicearray.py:190(device_ctypes_pointer)
        3    0.000    0.000    0.000    0.000 common.py:381(is_datetime64tz_dtype)
        4    0.000    0.000    0.000    0.000 managers.py:1613(internal_values)
        1    0.000    0.000    0.002    0.002 __init__.py:3(<module>)
        4    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:62(_path_split)
        2    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:401(_check_name_wrapper)
        2    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:471(_validate_timestamp_pyc)
        1    0.000    0.000    0.000    0.000 contextlib.py:116(__exit__)
        4    0.000    0.000    0.000    0.000 sre_parse.py:224(__init__)
        2    0.000    0.000    0.000    0.000 tokenize.py:374(read_or_stop)
        3    0.000    0.000    0.000    0.000 format.py:877(_read_bytes)
        1    0.000    0.000    0.000    0.000 __init__.py:345(get_arch_list)
       13    0.000    0.000    0.000    0.000 module.py:1092(named_parameters)
        1    0.000    0.000    0.000    0.000 sampler.py:63(__init__)
        6    0.000    0.000    0.000    0.000 dataloader.py:426(_next_index)
        2    0.000    0.000    0.000    0.000 dummyarray.py:43(__init__)
        4    0.000    0.000    0.000    0.000 series.py:427(dtype)
        3    0.000    0.000    0.000    0.000 blocks.py:135(_check_ndim)
        4    0.000    0.000    0.000    0.000 column_accessor.py:109(_grouped_data)
        4    0.000    0.000    0.000    0.000 string.py:4781(set_base_mask)
        5    0.000    0.000    0.000    0.000 string.py:4800(__len__)
        3    0.000    0.000    0.000    0.000 {built-in method _codecs.utf_8_decode}
      2/1    0.000    0.000    0.002    0.002 <frozen importlib._bootstrap>:211(_call_with_frames_removed)
        2    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:369(__init__)
        8    0.000    0.000    0.000    0.000 enum.py:289(__call__)
       13    0.000    0.000    0.000    0.000 sre_parse.py:295(_class_escape)
        1    0.000    0.000    0.008    0.008 format.py:683(read_array)
        1    0.000    0.000    0.000    0.000 __init__.py:266(get_device_name)
        3    0.000    0.000    0.000    0.000 __init__.py:187(_checkLevel)
        2    0.000    0.000    0.000    0.000 __init__.py:716(__init__)
        2    0.000    0.000    2.794    1.397 container.py:188(__iadd__)
        1    0.000    0.000    0.000    0.000 sampler.py:210(__init__)
        1    0.000    0.000    0.000    0.000 dataloader.py:300(multiprocessing_context)
        2    0.000    0.000    0.000    0.000 dataloader.py:339(__iter__)
        2    0.000    0.000    0.000    0.000 devicearray.py:714(is_contiguous)
        2    0.000    0.000    0.000    0.000 buffer.py:67(__cuda_array_interface__)
        2    0.000    0.000    0.000    0.000 {pandas._libs.algos.ensure_object}
        9    0.000    0.000    0.000    0.000 managers.py:1575(_block)
        1    0.000    0.000    0.000    0.000 indexing.py:69(__init__)
        2    0.000    0.000    0.000    0.000 {method 'copy' of 'collections.OrderedDict' objects}
        9    0.000    0.000    0.000    0.000 {method 'translate' of 'bytearray' objects}
        3    0.000    0.000    0.000    0.000 {method 'decode' of 'bytes' objects}
        2    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:792(find_spec)
        6    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:859(__exit__)
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:1445(path_hook_for_FileFinder)
        1    0.000    0.000    0.000    0.000 contextlib.py:417(enter_context)
        8    0.000    0.000    0.000    0.000 enum.py:531(__new__)
        8    0.000    0.000    0.000    0.000 sre_compile.py:595(isstring)
        1    0.000    0.000    0.000    0.000 <__array_function__ internals>:2(all)
        1    0.000    0.000    0.000    0.000 ast.py:38(literal_eval)
        2    0.000    0.000    0.000    0.000 {built-in method _ctypes.POINTER}
       12    0.000    0.000    0.000    0.000 functional.py:69(<genexpr>)
       13    0.000    0.000    0.000    0.000 module.py:1068(parameters)
        1    0.000    0.000    0.000    0.000 api.py:214(_fill_stride_by_order)
        1    0.000    0.000    0.000    0.000 api.py:70(is_cuda_array)
        4    0.000    0.000    0.000    0.000 numeric.py:81(_validate_dtype)
        1    0.000    0.000    0.000    0.000 column_accessor.py:261(<dictcomp>)
        1    0.000    0.000    0.000    0.000 series.py:1718(dtype)
        5    0.000    0.000    0.000    0.000 series.py:2132(index)
        1    0.000    0.000    0.000    0.000 series.py:2153(iloc)
        1    0.000    0.000    0.000    0.000 join.py:14(Merge)
       14    0.000    0.000    0.000    0.000 {built-in method _imp.acquire_lock}
       48    0.000    0.000    0.000    0.000 {built-in method builtins.id}
        2    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:35(_new_module)
        3    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:143(__init__)
       16    0.000    0.000    0.000    0.000 enum.py:633(value)
        3    0.000    0.000    0.000    0.000 sre_compile.py:461(_get_literal_prefix)
        4    0.000    0.000    0.000    0.000 sre_parse.py:76(__init__)
        4    0.000    0.000    0.000    0.000 sre_parse.py:897(fix_flags)
        2    0.000    0.000    0.000    0.000 __init__.py:99(CFunctionType)
        8    0.000    0.000    0.000    0.000 {built-in method _ctypes.byref}
       10    0.000    0.000    0.000    0.000 module.py:1113(<lambda>)
        2    0.000    0.000    0.000    0.000 sampler.py:66(__iter__)
        2    0.000    0.000    0.000    0.000 dataloader.py:290(_get_iterator)
        6    0.000    0.000    0.000    0.000 dataloader.py:354(_auto_collation)
        1    0.000    0.000    0.000    0.000 dataloader.py:370(__len__)
       12    0.000    0.000    0.000    0.000 worker.py:83(get_worker_info)
        2    0.000    0.000    0.000    0.000 fetch.py:39(__init__)
        1    0.000    0.000    0.000    0.000 driver.py:346(get_device_count)
        1    0.000    0.000    0.000    0.000 driver.py:874(_ensure_memory_manager)
        1    0.000    0.000    0.000    0.000 driver.py:1079(prepare_for_use)
        2    0.000    0.000    0.001    0.000 devices.py:130(get_or_create_context)
        2    0.000    0.000    0.000    0.000 common.py:608(is_dtype_equal)
        6    0.000    0.000    0.000    0.000 common.py:194(<genexpr>)
        1    0.000    0.000    0.000    0.000 series.py:750(__array__)
        3    0.000    0.000    0.000    0.000 utils.py:347(_inner)
        1    0.000    0.000    0.000    0.000 spec.py:104(__init__)
        2    0.000    0.000    0.000    0.000 dataframe.py:488(<listcomp>)
       14    0.000    0.000    0.000    0.000 {built-in method _imp.release_lock}
        2    0.000    0.000    0.000    0.000 {built-in method _imp._fix_co_filename}
      2/1    0.000    0.000    0.002    0.002 {built-in method builtins.exec}
        4    0.000    0.000    0.000    0.000 {method 'rfind' of 'str' objects}
        3    0.000    0.000    0.000    0.000 {method 'startswith' of 'bytes' objects}
       11    0.000    0.000    0.000    0.000 {built-in method torch._C._cuda_getDeviceCount}
        3    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:151(__exit__)
        1    0.000    0.000    0.000    0.000 {built-in method _struct.calcsize}
        2    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:311(__enter__)
        2    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:416(parent)
        2    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:884(__init__)
        2    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:951(path_stats)
        6    0.000    0.000    0.000    0.000 _collections_abc.py:271(__subclasshook__)
        4    0.000    0.000    0.000    0.000 _collections_abc.py:676(items)
        2    0.000    0.000    0.000    0.000 _collections_abc.py:716(__contains__)
        1    0.000    0.000    0.002    0.002 contextlib.py:107(__enter__)
        1    0.000    0.000    0.000    0.000 {method 'item' of 'numpy.ndarray' objects}
        2    0.000    0.000    0.000    0.000 <string>:1(__new__)
        1    0.000    0.000    0.000    0.000 format.py:217(read_magic)
        4    0.000    0.000    0.000    0.000 functional.py:2647(<listcomp>)
        1    0.000    0.000    0.000    0.000 driver.py:569(__init__)
        3    0.000    0.000    0.000    0.000 devices.py:177(_get_attached_context)
        4    0.000    0.000    0.000    0.000 dummyarray.py:81(get_offset)
        4    0.000    0.000    0.000    0.000 dummyarray.py:181(is_contig)
        4    0.000    0.000    0.000    0.000 series.py:540(_values)
        3    0.000    0.000    0.000    0.000 blocks.py:233(mgr_locs)
        1    0.000    0.000    0.000    0.000 utils.py:358(<dictcomp>)
        1    0.000    0.000    0.000    0.000 utils.py:341(to_flat_dict)
        1    0.000    0.000    0.000    0.000 registry.py:212(_import_class)
        2    0.000    0.000    0.000    0.000 {method 'seek' of '_io.BufferedReader' objects}
        6    0.000    0.000    0.000    0.000 {built-in method from_bytes}
        6    0.000    0.000    0.000    0.000 {method 'insert' of 'list' objects}
        2    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:307(__init__)
        8    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:321(<genexpr>)
        8    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:1325(<genexpr>)
        1    0.000    0.000    0.000    0.000 contextlib.py:462(_push_exit_callback)
        1    0.000    0.000    0.000    0.000 fromnumeric.py:2337(all)
        1    0.000    0.000    0.000    0.000 utils.py:962(safe_eval)
        4    0.000    0.000    0.000    0.000 _reduction.py:7(get_enum)
        4    0.000    0.000    0.000    0.000 _VF.py:25(__getattr__)
        4    0.000    0.000    0.000    0.000 __init__.py:60(_tensor_or_tensors_to_tuple)
       12    0.000    0.000    0.000    0.000 __future__.py:18(get_overwrite_module_params_on_conversion)
        2    0.000    0.000    0.000    0.000 driver.py:2200(device_memory_size)
        1    0.000    0.000    0.001    0.001 devices.py:36(__getitem__)
        4    0.000    0.000    0.000    0.000 dummyarray.py:162(<genexpr>)
        4    0.000    0.000    0.000    0.000 numeric.py:150(is_all_dates)
        4    0.000    0.000    0.000    0.000 blocks.py:201(internal_values)
        4    0.000    0.000    0.000    0.000 blocks.py:315(dtype)
        4    0.000    0.000    0.000    0.000 {function StringColumn.set_base_children at 0x2b9494bab560}
        8    0.000    0.000    0.000    0.000 {built-in method _thread.get_ident}
       16    0.000    0.000    0.000    0.000 {method 'span' of 're.Match' objects}
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:98(_path_isdir)
        2    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:719(create_module)
        1    0.000    0.000    0.000    0.000 _collections_abc.py:367(__subclasshook__)
        1    0.000    0.000    0.000    0.000 contextlib.py:376(_exit_wrapper)
        1    0.000    0.000    0.000    0.000 contextlib.py:456(_push_cm_exit)
        1    0.000    0.000    0.000    0.000 multiarray.py:1043(copyto)
        1    0.000    0.000    0.000    0.000 tokenize.py:312(untokenize)
        1    0.000    0.000    0.000    0.000 format.py:282(descr_to_dtype)
        1    0.000    0.000    0.000    0.000 __init__.py:100(<listcomp>)
        1    0.000    0.000    0.000    0.000 __init__.py:1349(setLevel)
        2    0.000    0.000    0.000    0.000 __init__.py:1600(getEffectiveLevel)
        2    0.000    0.000    0.000    0.000 container.py:180(__len__)
        1    0.000    0.000    0.000    0.000 sampler.py:69(__len__)
        2    0.000    0.000    0.000    0.000 fetch.py:8(__init__)
        1    0.000    0.000    0.000    0.000 rmm.py:96(initialize)
        1    0.000    0.000    0.000    0.000 driver.py:189(_getpid)
        4    0.000    0.000    0.000    0.000 driver.py:1626(device_ctypes_pointer)
        1    0.000    0.000    0.000    0.000 {built-in method numba.mviewbuf.memoryview_get_extents_info}
        8    0.000    0.000    0.000    0.000 dummyarray.py:110(<genexpr>)
        1    0.000    0.000    0.000    0.000 syncdetect.py:32(_declare_synchronize)
        2    0.000    0.000    0.000    0.000 cast.py:1595(construct_1d_ndarray_preserving_na)
        1    0.000    0.000    0.000    0.000 common.py:274(maybe_iterable_to_list)
        1    0.000    0.000    0.000    0.000 base.py:5559(ensure_index)
        1    0.000    0.000    0.000    0.000 series.py:574(array)
        1    0.000    0.000    0.000    0.000 dircache.py:27(__init__)
        1    0.000    0.000    0.002    0.002 index.py:488(take)
        1    0.000    0.000    0.000    0.000 index.py:1998(dtype)
        3    0.000    0.000    0.000    0.000 index.py:2090(__init__)
        1    0.000    0.000    0.000    0.000 join.py:333(input_to_libcudf_casting_rules)
        1    0.000    0.000    0.000    0.000 join.py:412(libcudf_to_output_casting_rules)
        6    0.000    0.000    0.000    0.000 {method 'acquire' of '_thread.RLock' objects}
        6    0.000    0.000    0.000    0.000 {method 'release' of '_thread.RLock' objects}
        8    0.000    0.000    0.000    0.000 {built-in method _thread.allocate_lock}
        2    0.000    0.000    0.000    0.000 {built-in method _imp.is_frozen}
        2    0.000    0.000    0.000    0.000 {built-in method builtins.delattr}
        5    0.000    0.000    0.000    0.000 {method 'setdefault' of 'dict' objects}
        7    0.000    0.000    0.000    0.000 {method 'items' of 'dict' objects}
        4    0.000    0.000    0.000    0.000 {method 'copy' of 'dict' objects}
        1    0.000    0.000    0.000    0.000 {built-in method _struct.unpack}
        2    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:424(has_location)
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:929(_sanity_check)
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:994(_gcd_import)
        2    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:909(get_filename)
        1    0.000    0.000    0.000    0.000 codecs.py:260(__init__)
        1    0.000    0.000    0.000    0.000 _collections_abc.py:349(__subclasshook__)
        1    0.000    0.000    0.000    0.000 __init__.py:109(import_module)
        1    0.000    0.000    0.000    0.000 contextlib.py:374(_create_exit_wrapper)
        1    0.000    0.000    0.000    0.000 contextlib.py:387(__init__)
        1    0.000    0.000    0.000    0.000 sre_compile.py:432(_generate_overlap_table)
        2    0.000    0.000    0.000    0.000 sre_compile.py:492(_get_charset_prefix)
        1    0.000    0.000    0.000    0.000 tokenize.py:219(__init__)
        1    0.000    0.000    0.000    0.000 tokenize.py:672(generate_tokens)
        1    0.000    0.000    0.290    0.290 module.py:449(cuda)
        1    0.000    0.000    0.000    0.000 __init__.py:1368(info)
        1    0.000    0.000    0.000    0.000 __init__.py:1526(addHandler)
        1    0.000    0.000    0.000    0.000 __init__.py:2073(createLock)
        1    0.000    0.000    0.000    0.000 sampler.py:235(__len__)
        3    0.000    0.000    0.000    0.000 dataloader.py:358(_index_sampler)
        2    0.000    0.000    0.000    0.000 driver.py:413(__exit__)
        1    0.000    0.000    0.000    0.000 driver.py:560(met_requirement_for_device)
        2    0.000    0.000    0.000    0.000 devices.py:180(_set_attached_context)
        1    0.000    0.000    0.000    0.000 devices.py:208(get_context)
        2    0.000    0.000    0.000    0.000 dummyarray.py:195(<listcomp>)
        4    0.000    0.000    0.000    0.000 {function StringColumn.set_base_mask at 0x2b9494bab4d0}
        1    0.000    0.000    0.000    0.000 registry.py:44(register_implementation)
        1    0.000    0.000    0.000    0.000 local.py:27(__init__)
        2    0.000    0.000    0.000    0.000 {method 'readline' of '_io.StringIO' objects}
        1    0.000    0.000    0.000    0.000 {method '__enter__' of '_io._IOBase' objects}
        2    0.000    0.000    0.000    0.000 {built-in method time.perf_counter}
        2    0.000    0.000    0.000    0.000 {built-in method _weakref.proxy}
        1    0.000    0.000    0.000    0.000 {built-in method builtins.sorted}
       11    0.000    0.000    0.000    0.000 {method 'isidentifier' of 'str' objects}
        4    0.000    0.000    0.000    0.000 {method 'values' of 'dict' objects}
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:194(_lock_unlock_module)
        2    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:719(find_spec)
        1    0.000    0.000    0.000    0.000 contextlib.py:478(__enter__)
        5    0.000    0.000    0.000    0.000 sre_compile.py:453(_get_iscased)
        1    0.000    0.000    0.000    0.000 fromnumeric.py:71(<dictcomp>)
        1    0.000    0.000    0.000    0.000 fromnumeric.py:2333(_all_dispatcher)
        1    0.000    0.000    0.000    0.000 ast.py:30(parse)
        1    0.000    0.000    0.000    0.000 format.py:190(_check_version)
        3    0.000    0.000    0.000    0.000 msms.py:35(__len__)
        1    0.000    0.000    0.000    0.000 driver.py:417(__bool__)
        1    0.000    0.000    0.000    0.000 devices.py:73(__init__)
        1    0.000    0.000    0.000    0.000 devices.py:76(__getattr__)
        1    0.000    0.000    0.000    0.000 devicearray.py:385(nbytes)
        4    0.000    0.000    0.000    0.000 dummyarray.py:105(is_contiguous)
        4    0.000    0.000    0.000    0.000 dummyarray.py:163(<genexpr>)
        4    0.000    0.000    0.000    0.000 {function StringColumn.set_base_data at 0x2b9494bab440}
        1    0.000    0.000    0.000    0.000 {built-in method sys.exc_info}
        1    0.000    0.000    0.000    0.000 {method 'rsplit' of 'str' objects}
        6    0.000    0.000    0.000    0.000 {method 'lower' of 'str' objects}
        1    0.000    0.000    0.000    0.000 {method 'strip' of 'str' objects}
        1    0.000    0.000    0.000    0.000 {method 'upper' of 'str' objects}
        1    0.000    0.000    0.000    0.000 {method 'keys' of 'dict' objects}
        2    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:40(_relax_case)
        1    0.000    0.000    0.000    0.000 format.py:597(<listcomp>)
        1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
        1    0.000    0.000    0.000    0.000 {method 'append' of 'collections.deque' objects}
        1    0.000    0.000    0.000    0.000 {method 'pop' of 'collections.deque' objects}
        1    0.000    0.000    0.000    0.000 {method 'isdisjoint' of 'set' objects}
        1    0.000    0.000    0.000    0.000 {built-in method torch._C._cuda_getCompiledVersion}


