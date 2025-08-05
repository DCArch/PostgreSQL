/* contrib/dcsim/dcsim--1.0.sql */

-- complain if script is sourced in psql, rather than via CREATE EXTENSION
\echo Use "CREATE EXTENSION dcsim" to load this file. \quit

CREATE FUNCTION dcsim_start_simulation()
        RETURNS void 
        AS 'MODULE_PATHNAME'
        LANGUAGE C STRICT;

CREATE FUNCTION dcsim_end_simulation()
        RETURNS void
        AS 'MODULE_PATHNAME'
        LANGUAGE C STRICT;
