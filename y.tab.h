/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     SWITCH = 258,
     CASE = 259,
     IDENTIFIER = 260,
     NUM = 261,
     SEMICOLON = 262,
     OP = 263,
     RELOP = 264,
     OPENBR = 265,
     CLOSEBR = 266,
     OPENCUBR = 267,
     CLOSECUBR = 268,
     NL = 269,
     COLON = 270,
     BREAK = 271,
     DEFAULT = 272,
     IF = 273,
     ELSE = 274,
     DATATYPE = 275
   };
#endif
/* Tokens.  */
#define SWITCH 258
#define CASE 259
#define IDENTIFIER 260
#define NUM 261
#define SEMICOLON 262
#define OP 263
#define RELOP 264
#define OPENBR 265
#define CLOSEBR 266
#define OPENCUBR 267
#define CLOSECUBR 268
#define NL 269
#define COLON 270
#define BREAK 271
#define DEFAULT 272
#define IF 273
#define ELSE 274
#define DATATYPE 275




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

