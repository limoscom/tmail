#
# DO NOT MODIFY!!!!
# This file is automatically generated by racc 1.4.5
# from racc grammer file "lib/tmail/parser.y".
#

require 'racc/parser'


#
# parser.rb
#
# Copyright (c) 1998-2007 Minero Aoki
#
# This program is free software.
# You can distribute/modify this program under the terms of
# the GNU Lesser General Public License version 2.1.
#

require 'tmail/scanner'
require 'tmail/utils'


module TMail

  class Parser < Racc::Parser

module_eval <<'..end lib/tmail/parser.y modeval..id2dd1c7d21d', 'lib/tmail/parser.y', 340

  include TextUtils

  def self.parse( ident, str, cmt = nil )
    str = special_quote_address(str) if ident.to_s =~ /M?ADDRESS/
    new.parse(ident, str, cmt)
  end

  def self.special_quote_address(str) #:nodoc:
    # Takes a string which is an address and adds quotation marks to special
    # edge case methods that the RACC parser can not handle.
    #
    # Right now just handles two edge cases:
    #
    # Full stop as the last character of the display name:
    #   Mikel L. <mikel@me.com>
    # Returns:
    #   "Mikel L." <mikel@me.com>
    #
    # Unquoted @ symbol in the display name:
    #   mikel@me.com <mikel@me.com>
    # Returns:
    #   "mikel@me.com" <mikel@me.com>
    #
    # Any other address not matching these patterns just gets returned as is.
    case
    # This handles the missing "" in an older version of Apple Mail.app
    # around the display name when the display name contains a '@'
    # like 'mikel@me.com <mikel@me.com>'
    # Just quotes it to: '"mikel@me.com" <mikel@me.com>'
    when str =~ /\A([^"].+@.+[^"])\s(<.*?>)\Z/
      return "\"#{$1}\" #{$2}"
    # This handles cases where 'Mikel A. <mikel@me.com>' which is a trailing
    # full stop before the address section.  Just quotes it to
    # '"Mikel A." <mikel@me.com>'
    when str =~ /\A(.*?\.)\s(<.*?>)\s*\Z/
      return "\"#{$1}\" #{$2}"
    else
      str
    end
  end

  MAILP_DEBUG = false

  def initialize
    self.debug = MAILP_DEBUG
  end

  def debug=( flag )
    @yydebug = flag && Racc_debug_parser
    @scanner_debug = flag
  end

  def debug
    @yydebug
  end

  def parse( ident, str, comments = nil )
    @scanner = Scanner.new(str, ident, comments)
    @scanner.debug = @scanner_debug
    @first = [ident, ident]
    result = yyparse(self, :parse_in)
    comments.map! {|c| to_kcode(c) } if comments
    result
  end

  private

  def parse_in( &block )
    yield @first
    @scanner.scan(&block)
  end
  
  def on_error( t, val, vstack )
    raise SyntaxError, "parse error on token #{racc_token2str t}"
  end

..end lib/tmail/parser.y modeval..id2dd1c7d21d

##### racc 1.4.5 generates ###

racc_reduce_table = [
 0, 0, :racc_error,
 2, 35, :_reduce_1,
 2, 35, :_reduce_2,
 2, 35, :_reduce_3,
 2, 35, :_reduce_4,
 2, 35, :_reduce_5,
 2, 35, :_reduce_6,
 2, 35, :_reduce_7,
 2, 35, :_reduce_8,
 2, 35, :_reduce_9,
 2, 35, :_reduce_10,
 2, 35, :_reduce_11,
 2, 35, :_reduce_12,
 6, 36, :_reduce_13,
 0, 48, :_reduce_none,
 2, 48, :_reduce_none,
 3, 49, :_reduce_16,
 5, 49, :_reduce_17,
 1, 50, :_reduce_18,
 7, 37, :_reduce_19,
 0, 51, :_reduce_none,
 2, 51, :_reduce_21,
 0, 52, :_reduce_none,
 2, 52, :_reduce_23,
 1, 58, :_reduce_24,
 3, 58, :_reduce_25,
 2, 58, :_reduce_26,
 0, 53, :_reduce_none,
 2, 53, :_reduce_28,
 0, 54, :_reduce_29,
 3, 54, :_reduce_30,
 0, 55, :_reduce_none,
 2, 55, :_reduce_32,
 2, 55, :_reduce_33,
 0, 56, :_reduce_none,
 2, 56, :_reduce_35,
 1, 61, :_reduce_36,
 1, 61, :_reduce_37,
 0, 57, :_reduce_none,
 2, 57, :_reduce_39,
 1, 38, :_reduce_none,
 1, 38, :_reduce_none,
 3, 38, :_reduce_none,
 1, 46, :_reduce_none,
 1, 46, :_reduce_none,
 1, 46, :_reduce_none,
 1, 39, :_reduce_none,
 2, 39, :_reduce_47,
 1, 64, :_reduce_48,
 3, 64, :_reduce_49,
 1, 68, :_reduce_none,
 1, 68, :_reduce_none,
 1, 69, :_reduce_52,
 3, 69, :_reduce_53,
 1, 47, :_reduce_none,
 1, 47, :_reduce_none,
 2, 47, :_reduce_56,
 2, 67, :_reduce_none,
 3, 65, :_reduce_58,
 2, 65, :_reduce_59,
 1, 70, :_reduce_60,
 2, 70, :_reduce_61,
 4, 62, :_reduce_62,
 3, 62, :_reduce_63,
 2, 72, :_reduce_none,
 2, 73, :_reduce_65,
 4, 73, :_reduce_66,
 3, 63, :_reduce_67,
 1, 63, :_reduce_68,
 1, 74, :_reduce_none,
 2, 74, :_reduce_70,
 1, 71, :_reduce_71,
 3, 71, :_reduce_72,
 1, 59, :_reduce_73,
 3, 59, :_reduce_74,
 1, 76, :_reduce_75,
 2, 76, :_reduce_76,
 1, 75, :_reduce_none,
 1, 75, :_reduce_none,
 1, 75, :_reduce_none,
 1, 77, :_reduce_none,
 1, 77, :_reduce_none,
 1, 77, :_reduce_none,
 1, 66, :_reduce_none,
 2, 66, :_reduce_none,
 3, 60, :_reduce_85,
 1, 40, :_reduce_86,
 3, 40, :_reduce_87,
 1, 79, :_reduce_none,
 2, 79, :_reduce_89,
 1, 41, :_reduce_90,
 2, 41, :_reduce_91,
 3, 42, :_reduce_92,
 5, 43, :_reduce_93,
 3, 43, :_reduce_94,
 0, 80, :_reduce_95,
 5, 80, :_reduce_96,
 5, 80, :_reduce_97,
 1, 44, :_reduce_98,
 3, 45, :_reduce_99,
 0, 81, :_reduce_none,
 1, 81, :_reduce_none,
 1, 78, :_reduce_none,
 1, 78, :_reduce_none,
 1, 78, :_reduce_none,
 1, 78, :_reduce_none,
 1, 78, :_reduce_none,
 1, 78, :_reduce_none,
 1, 78, :_reduce_none ]

racc_reduce_n = 109

racc_shift_n = 167

racc_action_table = [
   -69,   130,   -70,    23,    25,   153,    94,    29,    31,   142,
   143,    16,    17,    20,    22,    98,   -69,   154,   -70,    32,
   -69,   107,   -70,   145,   146,    78,   -69,    91,   -70,    75,
   -70,    23,    25,   120,    88,    29,    31,   105,   106,    16,
    17,    20,    22,    81,    27,    23,    25,    32,   112,    29,
    31,    96,    80,    16,    17,    20,    22,   117,    27,    23,
    25,    32,    79,    29,    31,    78,   123,    16,    17,    20,
    22,   100,    27,    23,    25,    32,   125,    29,    31,   113,
   115,    16,    17,    20,    22,   126,    23,    25,   101,    32,
    29,    31,    91,   128,    16,    17,    20,    22,   129,    27,
    23,    25,    32,   101,    29,    31,   101,    75,    16,    17,
    20,    22,    77,    52,    23,    25,    32,    65,    29,    31,
   133,    78,    16,    17,    20,    22,    62,    23,    25,   136,
    32,    29,    31,    60,    44,    16,    17,    20,    22,   139,
    23,    25,   101,    32,    29,    31,   101,   100,    16,    17,
    20,    22,   100,    27,    23,    25,    32,   101,    29,    31,
   147,   148,    16,    17,    20,    22,   151,    23,    25,   152,
    32,    29,    31,    74,    42,    16,    17,    20,    22,   156,
   158,    92,    40,    32,    23,    25,    15,    68,    29,    31,
   163,    40,    16,    17,    20,    22,   165,    27,    23,    25,
    32,   166,    29,    31,   nil,   nil,    16,    17,    20,    22,
   nil,    27,    23,    25,    32,   nil,    29,    31,   nil,   nil,
    16,    17,    20,    22,   nil,    23,    25,   nil,    32,    29,
    31,   nil,   nil,    16,    17,    20,    22,   nil,    23,    25,
   nil,    32,    29,    31,   nil,   nil,    16,    17,    20,    22,
   nil,    23,    25,   nil,    32,    29,    31,   nil,   nil,    16,
    17,    20,    22,   nil,    27,   nil,   nil,    32,    23,    25,
   120,   nil,    29,    31,   nil,   nil,    16,    17,    20,    22,
   nil,    27,    23,    25,    32,   nil,    29,    31,   nil,   nil,
    16,    17,    20,    22,   nil,    23,    25,   109,    32,    29,
    31,    74,   nil,    16,    17,    20,    22,   nil,    84,    25,
   nil,    32,    29,    31,   nil,    87,    16,    17,    20,    22,
    84,    25,   nil,   109,    29,    31,   nil,    87,    16,    17,
    20,    22,    84,    25,   nil,   nil,    29,    31,   nil,    87,
    16,    17,    20,    22,    84,    25,   nil,   nil,    29,    31,
   nil,    87,    16,    17,    20,    22,    84,    25,   nil,   nil,
    29,    31,   nil,    87,    16,    17,    20,    22,    84,    25,
   nil,   nil,    29,    31,   nil,    87,    16,    17,    20,    22,
     4,     6,     7,     8,     9,    10,    11,    12,    13,     1,
     2,     3,    84,    25,   nil,   nil,    29,    31,   nil,    87,
    16,    17,    20,    22 ]

racc_action_check = [
    28,   112,    75,    71,    71,   143,    56,    71,    71,   134,
   134,    71,    71,    71,    71,    62,    28,   143,    75,    71,
    28,    73,    75,   136,   136,    51,    28,    50,    75,    28,
    75,   127,   127,   127,    45,   127,   127,    72,    72,   127,
   127,   127,   127,    42,   127,     3,     3,   127,    80,     3,
     3,    60,    41,     3,     3,     3,     3,    89,     3,   151,
   151,     3,    40,   151,   151,    36,    96,   151,   151,   151,
   151,    97,   151,    55,    55,   151,    98,    55,    55,    86,
    86,    55,    55,    55,    55,   100,     7,     7,    86,    55,
     7,     7,   102,   104,     7,     7,     7,     7,   105,     7,
     8,     8,     7,   108,     8,     8,   111,    70,     8,     8,
     8,     8,    33,     8,     9,     9,     8,    13,     9,     9,
   117,   121,     9,     9,     9,     9,    12,    10,    10,   126,
     9,    10,    10,    11,     6,    10,    10,    10,    10,   130,
     2,     2,   131,    10,     2,     2,    67,   135,     2,     2,
     2,     2,    66,     2,   122,   122,     2,   138,   122,   122,
   139,   140,   122,   122,   122,   122,   141,    52,    52,   142,
   122,    52,    52,    52,     5,    52,    52,    52,    52,   147,
   150,    52,     4,    52,    26,    26,     1,    26,    26,    26,
   156,   158,    26,    26,    26,    26,   162,    26,    68,    68,
    26,   163,    68,    68,   nil,   nil,    68,    68,    68,    68,
   nil,    68,    59,    59,    68,   nil,    59,    59,   nil,   nil,
    59,    59,    59,    59,   nil,   154,   154,   nil,    59,   154,
   154,   nil,   nil,   154,   154,   154,   154,   nil,    94,    94,
   nil,   154,    94,    94,   nil,   nil,    94,    94,    94,    94,
   nil,    38,    38,   nil,    94,    38,    38,   nil,   nil,    38,
    38,    38,    38,   nil,    38,   nil,   nil,    38,    90,    90,
    90,   nil,    90,    90,   nil,   nil,    90,    90,    90,    90,
   nil,    90,    76,    76,    90,   nil,    76,    76,   nil,   nil,
    76,    76,    76,    76,   nil,    27,    27,    76,    76,    27,
    27,    27,   nil,    27,    27,    27,    27,   nil,   114,   114,
   nil,    27,   114,   114,   nil,   114,   114,   114,   114,   114,
    44,    44,   nil,   114,    44,    44,   nil,    44,    44,    44,
    44,    44,    74,    74,   nil,   nil,    74,    74,   nil,    74,
    74,    74,    74,    74,   113,   113,   nil,   nil,   113,   113,
   nil,   113,   113,   113,   113,   113,   129,   129,   nil,   nil,
   129,   129,   nil,   129,   129,   129,   129,   129,    88,    88,
   nil,   nil,    88,    88,   nil,    88,    88,    88,    88,    88,
     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     0,     0,    77,    77,   nil,   nil,    77,    77,   nil,    77,
    77,    77,    77,    77 ]

racc_action_pointer = [
   378,   155,   126,    31,   167,   174,   116,    72,    86,   100,
   113,   119,    95,    86,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   170,   281,     0,   nil,
   nil,   nil,   nil,    92,   nil,   nil,    39,   nil,   237,   nil,
    46,    38,    43,   nil,   306,    15,   nil,   nil,   nil,   nil,
    11,    -1,   153,   nil,   nil,    59,   -10,   nil,   nil,   198,
    22,   nil,   -17,   nil,   nil,   nil,   126,   117,   184,   nil,
    78,   -11,    21,    -7,   318,     2,   268,   378,   nil,   nil,
    33,   nil,   nil,   nil,   nil,   nil,    59,   nil,   354,    35,
   254,   nil,   nil,   nil,   224,   nil,    52,    45,    45,   nil,
    54,   nil,    76,   nil,    65,    78,   nil,   nil,    74,   nil,
   nil,    77,   -13,   330,   294,   nil,   nil,   105,   nil,   nil,
   nil,    95,   140,   nil,   nil,   nil,    96,    17,   nil,   342,
   125,   113,   nil,   nil,   -14,   121,    -7,   nil,   128,   143,
   146,   141,   154,   -10,   nil,   nil,   nil,   165,   nil,   nil,
   154,    45,   nil,   nil,   211,   nil,   173,   nil,   176,   nil,
   nil,   nil,   168,   187,   nil,   nil,   nil ]

racc_action_default = [
  -109,  -109,  -109,  -109,   -14,  -109,   -20,  -109,  -109,  -109,
  -109,  -109,  -109,  -109,   -10,   -95,  -105,  -106,   -77,   -44,
  -107,   -11,  -108,   -79,   -43,  -102,  -109,  -109,   -60,  -103,
   -55,  -104,   -78,   -68,   -54,   -71,   -45,   -12,  -109,    -1,
  -109,  -109,  -109,    -2,  -109,   -22,   -51,   -48,   -50,    -3,
   -40,   -41,  -109,   -46,    -4,   -86,    -5,   -88,    -6,   -90,
  -109,    -7,   -95,    -8,    -9,   -98,  -100,   -61,   -59,   -56,
   -69,  -109,  -109,  -109,  -109,   -75,  -109,  -109,   -57,   -15,
  -109,   167,   -73,   -80,   -82,   -21,   -24,   -81,  -109,   -27,
  -109,   -83,   -47,   -89,  -109,   -91,  -109,  -100,  -109,   -99,
  -101,   -75,   -58,   -52,  -109,  -109,   -64,   -63,   -65,   -76,
   -72,   -67,  -109,  -109,  -109,   -26,   -23,  -109,   -29,   -49,
   -84,   -42,   -87,   -92,   -94,   -95,  -109,  -109,   -62,  -109,
  -109,   -25,   -74,   -28,   -31,  -100,  -109,   -53,   -66,  -109,
  -109,   -34,  -109,  -109,   -93,   -96,   -97,  -109,   -18,   -13,
   -38,  -109,   -30,   -33,  -109,   -32,   -16,   -19,   -14,   -35,
   -36,   -37,  -109,  -109,   -39,   -85,   -17 ]

racc_goto_table = [
    39,    67,    70,    73,    38,    66,    69,    24,    37,    57,
    59,    36,    55,    67,    99,    90,    85,   157,    69,   108,
    83,   134,   111,    76,    49,    53,   141,    70,    73,   150,
   118,    89,    45,   155,   159,   149,   140,    21,    14,    19,
   119,   102,    64,    63,    61,   124,    70,   104,    58,   132,
    83,    56,    97,    83,    54,    93,    43,     5,   131,    95,
   116,   nil,    76,   nil,    83,    76,   nil,   127,   nil,    38,
   nil,   nil,   nil,   103,   138,   nil,   110,   nil,   nil,   nil,
   nil,   nil,   nil,   144,   nil,   nil,   nil,   nil,   nil,    83,
    83,   nil,   nil,   nil,    57,   nil,   nil,   122,   nil,   121,
   nil,   nil,   nil,   nil,   nil,    83,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   135,   nil,   nil,   nil,   nil,
   nil,   nil,    93,   nil,   nil,   nil,    70,   161,    38,    70,
   162,   160,   137,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   164 ]

racc_goto_check = [
     2,    37,    37,    29,    36,    46,    28,    13,    13,    41,
    41,    31,    45,    37,    47,    32,    24,    23,    28,    25,
    44,    20,    25,    42,     4,     4,    21,    37,    29,    22,
    19,    18,    17,    26,    27,    16,    15,    12,    11,    33,
    34,    35,    10,     9,     8,    47,    37,    29,     7,    43,
    44,     6,    46,    44,     5,    41,     3,     1,    25,    41,
    24,   nil,    42,   nil,    44,    42,   nil,    32,   nil,    36,
   nil,   nil,   nil,    13,    25,   nil,    41,   nil,   nil,   nil,
   nil,   nil,   nil,    47,   nil,   nil,   nil,   nil,   nil,    44,
    44,   nil,   nil,   nil,    41,   nil,   nil,    45,   nil,    31,
   nil,   nil,   nil,   nil,   nil,    44,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,    46,   nil,   nil,   nil,   nil,
   nil,   nil,    41,   nil,   nil,   nil,    37,    29,    36,    37,
    29,    28,    13,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,     2 ]

racc_goto_pointer = [
   nil,    57,    -4,    50,    17,    46,    42,    38,    33,    31,
    29,    37,    35,     5,   nil,   -94,  -105,    26,   -14,   -59,
   -97,  -108,  -112,  -133,   -28,   -55,  -110,  -117,   -20,   -24,
   nil,     9,   -35,    37,   -50,   -27,     1,   -25,   nil,   nil,
   nil,     0,    -5,   -65,   -24,     3,   -10,   -52 ]

racc_goto_default = [
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,    48,    41,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,    86,   nil,   nil,    30,    34,
    50,    51,   nil,    46,    47,   nil,    26,    28,    71,    72,
    33,    35,   114,    82,    18,   nil,   nil,   nil ]

racc_token_table = {
 false => 0,
 Object.new => 1,
 :DATETIME => 2,
 :RECEIVED => 3,
 :MADDRESS => 4,
 :RETPATH => 5,
 :KEYWORDS => 6,
 :ENCRYPTED => 7,
 :MIMEVERSION => 8,
 :CTYPE => 9,
 :CENCODING => 10,
 :CDISPOSITION => 11,
 :ADDRESS => 12,
 :MAILBOX => 13,
 :DIGIT => 14,
 :ATOM => 15,
 "," => 16,
 ":" => 17,
 :FROM => 18,
 :BY => 19,
 "@" => 20,
 :DOMLIT => 21,
 :VIA => 22,
 :WITH => 23,
 :ID => 24,
 :FOR => 25,
 ";" => 26,
 "<" => 27,
 ">" => 28,
 "." => 29,
 :QUOTED => 30,
 :TOKEN => 31,
 "/" => 32,
 "=" => 33 }

racc_use_result_var = false

racc_nt_base = 34

Racc_arg = [
 racc_action_table,
 racc_action_check,
 racc_action_default,
 racc_action_pointer,
 racc_goto_table,
 racc_goto_check,
 racc_goto_default,
 racc_goto_pointer,
 racc_nt_base,
 racc_reduce_table,
 racc_token_table,
 racc_shift_n,
 racc_reduce_n,
 racc_use_result_var ]

Racc_token_to_s_table = [
'$end',
'error',
'DATETIME',
'RECEIVED',
'MADDRESS',
'RETPATH',
'KEYWORDS',
'ENCRYPTED',
'MIMEVERSION',
'CTYPE',
'CENCODING',
'CDISPOSITION',
'ADDRESS',
'MAILBOX',
'DIGIT',
'ATOM',
'","',
'":"',
'FROM',
'BY',
'"@"',
'DOMLIT',
'VIA',
'WITH',
'ID',
'FOR',
'";"',
'"<"',
'">"',
'"."',
'QUOTED',
'TOKEN',
'"/"',
'"="',
'$start',
'content',
'datetime',
'received',
'addrs_TOP',
'retpath',
'keys',
'enc',
'version',
'ctype',
'cencode',
'cdisp',
'addr_TOP',
'mbox',
'day',
'hour',
'zone',
'from',
'by',
'via',
'with',
'id',
'for',
'received_datetime',
'received_domain',
'domain',
'msgid',
'received_addrspec',
'routeaddr',
'spec',
'addrs',
'group_bare',
'commas',
'group',
'addr',
'mboxes',
'addr_phrase',
'local_head',
'routes',
'at_domains',
'local',
'word',
'dots',
'domword',
'atom',
'phrase',
'params',
'opt_semicolon']

Racc_debug_parser = false

##### racc system variables end #####

 # reduce 0 omitted

module_eval <<'.,.,', 'lib/tmail/parser.y', 16
  def _reduce_1( val, _values)
 val[1]
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 17
  def _reduce_2( val, _values)
 val[1]
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 18
  def _reduce_3( val, _values)
 val[1]
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 19
  def _reduce_4( val, _values)
 val[1]
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 20
  def _reduce_5( val, _values)
 val[1]
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 21
  def _reduce_6( val, _values)
 val[1]
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 22
  def _reduce_7( val, _values)
 val[1]
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 23
  def _reduce_8( val, _values)
 val[1]
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 24
  def _reduce_9( val, _values)
 val[1]
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 25
  def _reduce_10( val, _values)
 val[1]
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 26
  def _reduce_11( val, _values)
 val[1]
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 27
  def _reduce_12( val, _values)
 val[1]
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 36
  def _reduce_13( val, _values)
                  t = Time.gm(val[3].to_i, val[2], val[1].to_i, 0, 0, 0)
                  (t + val[4] - val[5]).localtime
  end
.,.,

 # reduce 14 omitted

 # reduce 15 omitted

module_eval <<'.,.,', 'lib/tmail/parser.y', 45
  def _reduce_16( val, _values)
                  (val[0].to_i * 60 * 60) +
                  (val[2].to_i * 60)
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 51
  def _reduce_17( val, _values)
                  (val[0].to_i * 60 * 60) +
                  (val[2].to_i * 60) +
                  (val[4].to_i)
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 56
  def _reduce_18( val, _values)
                  timezone_string_to_unixtime(val[0])
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 61
  def _reduce_19( val, _values)
                  val
  end
.,.,

 # reduce 20 omitted

module_eval <<'.,.,', 'lib/tmail/parser.y', 67
  def _reduce_21( val, _values)
                  val[1]
  end
.,.,

 # reduce 22 omitted

module_eval <<'.,.,', 'lib/tmail/parser.y', 73
  def _reduce_23( val, _values)
                  val[1]
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 79
  def _reduce_24( val, _values)
                  join_domain(val[0])
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 83
  def _reduce_25( val, _values)
                  join_domain(val[2])
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 87
  def _reduce_26( val, _values)
                  join_domain(val[0])
  end
.,.,

 # reduce 27 omitted

module_eval <<'.,.,', 'lib/tmail/parser.y', 93
  def _reduce_28( val, _values)
                  val[1]
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 98
  def _reduce_29( val, _values)
                  []
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 103
  def _reduce_30( val, _values)
                  val[0].push val[2]
                  val[0]
  end
.,.,

 # reduce 31 omitted

module_eval <<'.,.,', 'lib/tmail/parser.y', 109
  def _reduce_32( val, _values)
                  val[1]
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 113
  def _reduce_33( val, _values)
                  val[1]
  end
.,.,

 # reduce 34 omitted

module_eval <<'.,.,', 'lib/tmail/parser.y', 119
  def _reduce_35( val, _values)
                  val[1]
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 125
  def _reduce_36( val, _values)
                  val[0].spec
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 129
  def _reduce_37( val, _values)
                  val[0].spec
  end
.,.,

 # reduce 38 omitted

module_eval <<'.,.,', 'lib/tmail/parser.y', 136
  def _reduce_39( val, _values)
                  val[1]
  end
.,.,

 # reduce 40 omitted

 # reduce 41 omitted

 # reduce 42 omitted

 # reduce 43 omitted

 # reduce 44 omitted

 # reduce 45 omitted

 # reduce 46 omitted

module_eval <<'.,.,', 'lib/tmail/parser.y', 146
  def _reduce_47( val, _values)
 [ Address.new(nil, nil) ]
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 152
  def _reduce_48( val, _values)
                  val
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 157
  def _reduce_49( val, _values)
                  val[0].push val[2]
                  val[0]
  end
.,.,

 # reduce 50 omitted

 # reduce 51 omitted

module_eval <<'.,.,', 'lib/tmail/parser.y', 165
  def _reduce_52( val, _values)
                  val
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 170
  def _reduce_53( val, _values)
                  val[0].push val[2]
                  val[0]
  end
.,.,

 # reduce 54 omitted

 # reduce 55 omitted

module_eval <<'.,.,', 'lib/tmail/parser.y', 178
  def _reduce_56( val, _values)
                  val[1].phrase = Decoder.decode(val[0])
                  val[1]
  end
.,.,

 # reduce 57 omitted

module_eval <<'.,.,', 'lib/tmail/parser.y', 185
  def _reduce_58( val, _values)
                  AddressGroup.new(val[0], val[2])
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 185
  def _reduce_59( val, _values)
 AddressGroup.new(val[0], [])
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 188
  def _reduce_60( val, _values)
 val[0].join('.')
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 189
  def _reduce_61( val, _values)
 val[0] << ' ' << val[1].join('.')
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 196
  def _reduce_62( val, _values)
                  val[2].routes.replace val[1]
                  val[2]
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 200
  def _reduce_63( val, _values)
                  val[1]
  end
.,.,

 # reduce 64 omitted

module_eval <<'.,.,', 'lib/tmail/parser.y', 203
  def _reduce_65( val, _values)
 [ val[1].join('.') ]
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 204
  def _reduce_66( val, _values)
 val[0].push val[3].join('.'); val[0]
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 206
  def _reduce_67( val, _values)
 Address.new( val[0], val[2] )
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 207
  def _reduce_68( val, _values)
 Address.new( val[0], nil )
  end
.,.,

 # reduce 69 omitted

module_eval <<'.,.,', 'lib/tmail/parser.y', 210
  def _reduce_70( val, _values)
 val[0].push ''; val[0]
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 213
  def _reduce_71( val, _values)
 val
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 222
  def _reduce_72( val, _values)
                  val[1].times do
                    val[0].push ''
                  end
                  val[0].push val[2]
                  val[0]
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 224
  def _reduce_73( val, _values)
 val
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 233
  def _reduce_74( val, _values)
                  val[1].times do
                    val[0].push ''
                  end
                  val[0].push val[2]
                  val[0]
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 234
  def _reduce_75( val, _values)
 0
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 235
  def _reduce_76( val, _values)
 val[0] + 1
  end
.,.,

 # reduce 77 omitted

 # reduce 78 omitted

 # reduce 79 omitted

 # reduce 80 omitted

 # reduce 81 omitted

 # reduce 82 omitted

 # reduce 83 omitted

 # reduce 84 omitted

module_eval <<'.,.,', 'lib/tmail/parser.y', 253
  def _reduce_85( val, _values)
                  val[1] = val[1].spec
                  val.join('')
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 254
  def _reduce_86( val, _values)
 val
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 255
  def _reduce_87( val, _values)
 val[0].push val[2]; val[0]
  end
.,.,

 # reduce 88 omitted

module_eval <<'.,.,', 'lib/tmail/parser.y', 258
  def _reduce_89( val, _values)
 val[0] << ' ' << val[1]
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 265
  def _reduce_90( val, _values)
                  val.push nil
                  val
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 269
  def _reduce_91( val, _values)
                  val
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 274
  def _reduce_92( val, _values)
                  [ val[0].to_i, val[2].to_i ]
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 279
  def _reduce_93( val, _values)
                  [ val[0].downcase, val[2].downcase, decode_params(val[3]) ]
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 283
  def _reduce_94( val, _values)
                  [ val[0].downcase, nil, decode_params(val[1]) ]
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 288
  def _reduce_95( val, _values)
                  {}
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 293
  def _reduce_96( val, _values)
                  val[0][ val[2].downcase ] = ('"' + val[4].to_s + '"')
                  val[0]
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 298
  def _reduce_97( val, _values)
                  val[0][ val[2].downcase ] = val[4]
                  val[0]
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 303
  def _reduce_98( val, _values)
                  val[0].downcase
  end
.,.,

module_eval <<'.,.,', 'lib/tmail/parser.y', 308
  def _reduce_99( val, _values)
                  [ val[0].downcase, decode_params(val[1]) ]
  end
.,.,

 # reduce 100 omitted

 # reduce 101 omitted

 # reduce 102 omitted

 # reduce 103 omitted

 # reduce 104 omitted

 # reduce 105 omitted

 # reduce 106 omitted

 # reduce 107 omitted

 # reduce 108 omitted

 def _reduce_none( val, _values)
  val[0]
 end

  end   # class Parser

end   # module TMail
