// main.cpp

#include <fmt/core.h>
#include <fmt/color.h>

#include <sqlite3.h>

int main(int argc, char** argv)
{
  fmt::print(fg(fmt::color::crimson) | fmt::emphasis::bold, "sqlite3 lib version: {}!\n", sqlite3_libversion());

  return 0;
}
