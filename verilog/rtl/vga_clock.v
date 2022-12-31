// Generator : SpinalHDL v1.8.0    git head : 4e3563a282582b41f4eaafc503787757251d23ea
// Component : VgaClock

`timescale 1ns/1ps

module thorkn_vgaclock (
  output              io_h_sync,
  output              io_v_sync,
  output              io_r,
  output              io_g,
  output              io_b,
  input               clk,
  input               reset
);

  wire                vga_sync_gen_io_h_sync;
  wire                vga_sync_gen_io_v_sync;
  wire                vga_sync_gen_io_activevideo;
  wire       [9:0]    vga_sync_gen_io_x;
  wire       [9:0]    vga_sync_gen_io_y;
  wire                vga_content_io_r;
  wire                vga_content_io_g;
  wire                vga_content_io_b;

  VgaSyncGen vga_sync_gen (
    .io_h_sync      (vga_sync_gen_io_h_sync     ), //o
    .io_v_sync      (vga_sync_gen_io_v_sync     ), //o
    .io_activevideo (vga_sync_gen_io_activevideo), //o
    .io_x           (vga_sync_gen_io_x[9:0]     ), //o
    .io_y           (vga_sync_gen_io_y[9:0]     ), //o
    .clk            (clk                        ), //i
    .reset          (reset                      )  //i
  );
  VgaContent vga_content (
    .io_x           (vga_sync_gen_io_x[9:0]     ), //i
    .io_y           (vga_sync_gen_io_y[9:0]     ), //i
    .io_activevideo (vga_sync_gen_io_activevideo), //i
    .io_r           (vga_content_io_r           ), //o
    .io_g           (vga_content_io_g           ), //o
    .io_b           (vga_content_io_b           ), //o
    .clk            (clk                        ), //i
    .reset          (reset                      )  //i
  );
  assign io_h_sync = vga_sync_gen_io_h_sync; // @[VgaClock.scala 20:15]
  assign io_v_sync = vga_sync_gen_io_v_sync; // @[VgaClock.scala 21:15]
  assign io_r = vga_content_io_r; // @[VgaClock.scala 27:10]
  assign io_g = vga_content_io_g; // @[VgaClock.scala 28:10]
  assign io_b = vga_content_io_b; // @[VgaClock.scala 29:10]

endmodule

module VgaContent (
  input      [9:0]    io_x,
  input      [9:0]    io_y,
  input               io_activevideo,
  output reg          io_r,
  output reg          io_g,
  output reg          io_b,
  input               clk,
  input               reset
);

  wire       [5:0]    clock_counters_io_seconds;
  wire       [5:0]    clock_counters_io_minutes;
  wire       [3:0]    clock_counters_io_hours;
  wire                _zz_when_VgaContent_l33;
  wire       [9:0]    _zz_when_VgaContent_l33_1;
  wire       [9:0]    _zz_when_VgaContent_l33_2;
  wire                _zz_when_VgaContent_l33_3;
  wire       [9:0]    _zz_when_VgaContent_l33_4;
  wire       [9:0]    _zz_when_VgaContent_l39;
  wire       [8:0]    _zz_when_VgaContent_l39_1;
  wire       [8:0]    _zz_when_VgaContent_l39_2;
  wire       [9:0]    _zz_when_VgaContent_l45;
  wire       [8:0]    _zz_when_VgaContent_l45_1;
  wire       [8:0]    _zz_when_VgaContent_l45_2;
  wire       [9:0]    _zz_when_VgaContent_l51;
  wire       [8:0]    _zz_when_VgaContent_l51_1;
  wire       [8:0]    _zz_when_VgaContent_l51_2;
  wire                when_VgaContent_l22;
  wire                when_VgaContent_l33;
  wire                when_VgaContent_l39;
  wire                when_VgaContent_l45;
  wire                when_VgaContent_l51;

  assign _zz_when_VgaContent_l39_1 = (9'h1a4 - _zz_when_VgaContent_l39_2);
  assign _zz_when_VgaContent_l39 = {1'd0, _zz_when_VgaContent_l39_1};
  assign _zz_when_VgaContent_l39_2 = (clock_counters_io_seconds * 3'b110);
  assign _zz_when_VgaContent_l45_1 = (9'h1a4 - _zz_when_VgaContent_l45_2);
  assign _zz_when_VgaContent_l45 = {1'd0, _zz_when_VgaContent_l45_1};
  assign _zz_when_VgaContent_l45_2 = (clock_counters_io_minutes * 3'b110);
  assign _zz_when_VgaContent_l51_1 = (9'h1a4 - _zz_when_VgaContent_l51_2);
  assign _zz_when_VgaContent_l51 = {1'd0, _zz_when_VgaContent_l51_1};
  assign _zz_when_VgaContent_l51_2 = (clock_counters_io_hours * 5'h1e);
  assign _zz_when_VgaContent_l33 = (((((((((((io_y == _zz_when_VgaContent_l33_1) || (io_y == _zz_when_VgaContent_l33_2)) || (io_y == 10'h05a)) || (io_y == 10'h078)) || (io_y == 10'h096)) || (io_y == 10'h097)) || (io_y == 10'h0b4)) || (io_y == 10'h0d2)) || (io_y == 10'h0f0)) || (io_y == 10'h0f1)) || (io_y == 10'h10e));
  assign _zz_when_VgaContent_l33_3 = (io_y == 10'h12c);
  assign _zz_when_VgaContent_l33_4 = 10'h14a;
  assign _zz_when_VgaContent_l33_1 = 10'h03c;
  assign _zz_when_VgaContent_l33_2 = 10'h03d;
  ClockCounters clock_counters (
    .io_seconds (clock_counters_io_seconds[5:0]), //o
    .io_minutes (clock_counters_io_minutes[5:0]), //o
    .io_hours   (clock_counters_io_hours[3:0]  ), //o
    .clk        (clk                           ), //i
    .reset      (reset                         )  //i
  );
  assign when_VgaContent_l22 = ((((io_x < 10'h004) || (10'h27b < io_x)) || (io_y < 10'h004)) || (10'h1db < io_y)); // @[BaseType.scala 305:24]
  always @(*) begin
    if(io_activevideo) begin
      if(when_VgaContent_l22) begin
        io_r = 1'b0; // @[VgaContent.scala 23:18]
      end else begin
        if(when_VgaContent_l33) begin
          io_r = 1'b1; // @[VgaContent.scala 34:18]
        end else begin
          if(when_VgaContent_l39) begin
            io_r = 1'b0; // @[VgaContent.scala 40:18]
          end else begin
            if(when_VgaContent_l45) begin
              io_r = 1'b0; // @[VgaContent.scala 46:18]
            end else begin
              if(when_VgaContent_l51) begin
                io_r = 1'b0; // @[VgaContent.scala 52:18]
              end else begin
                io_r = 1'b0; // @[VgaContent.scala 57:18]
              end
            end
          end
        end
      end
    end else begin
      io_r = 1'b0; // @[VgaContent.scala 62:14]
    end
  end

  always @(*) begin
    if(io_activevideo) begin
      if(when_VgaContent_l22) begin
        io_g = 1'b0; // @[VgaContent.scala 24:18]
      end else begin
        if(when_VgaContent_l33) begin
          io_g = 1'b0; // @[VgaContent.scala 35:18]
        end else begin
          if(when_VgaContent_l39) begin
            io_g = 1'b1; // @[VgaContent.scala 41:18]
          end else begin
            if(when_VgaContent_l45) begin
              io_g = 1'b1; // @[VgaContent.scala 47:18]
            end else begin
              if(when_VgaContent_l51) begin
                io_g = 1'b1; // @[VgaContent.scala 53:18]
              end else begin
                io_g = 1'b0; // @[VgaContent.scala 58:18]
              end
            end
          end
        end
      end
    end else begin
      io_g = 1'b0; // @[VgaContent.scala 63:14]
    end
  end

  always @(*) begin
    if(io_activevideo) begin
      if(when_VgaContent_l22) begin
        io_b = 1'b1; // @[VgaContent.scala 25:18]
      end else begin
        if(when_VgaContent_l33) begin
          io_b = 1'b0; // @[VgaContent.scala 36:18]
        end else begin
          if(when_VgaContent_l39) begin
            io_b = 1'b0; // @[VgaContent.scala 42:18]
          end else begin
            if(when_VgaContent_l45) begin
              io_b = 1'b0; // @[VgaContent.scala 48:18]
            end else begin
              if(when_VgaContent_l51) begin
                io_b = 1'b0; // @[VgaContent.scala 54:18]
              end else begin
                io_b = 1'b0; // @[VgaContent.scala 59:18]
              end
            end
          end
        end
      end
    end else begin
      io_b = 1'b0; // @[VgaContent.scala 64:14]
    end
  end

  assign when_VgaContent_l33 = (((10'h03c <= io_x) && (io_x < 10'h244)) && (((((((_zz_when_VgaContent_l33 || _zz_when_VgaContent_l33_3) || (io_y == _zz_when_VgaContent_l33_4)) || (io_y == 10'h14b)) || (io_y == 10'h168)) || (io_y == 10'h186)) || (io_y == 10'h1a4)) || (io_y == 10'h1a5))); // @[BaseType.scala 305:24]
  assign when_VgaContent_l39 = ((((10'h1a4 <= io_x) && (io_x < 10'h208)) && (io_y <= 10'h1a4)) && (_zz_when_VgaContent_l39 <= io_y)); // @[BaseType.scala 305:24]
  assign when_VgaContent_l45 = ((((10'h10e <= io_x) && (io_x < 10'h172)) && (io_y <= 10'h1a4)) && (_zz_when_VgaContent_l45 <= io_y)); // @[BaseType.scala 305:24]
  assign when_VgaContent_l51 = ((((10'h078 <= io_x) && (io_x < 10'h0dc)) && (io_y <= 10'h1a4)) && (_zz_when_VgaContent_l51 <= io_y)); // @[BaseType.scala 305:24]

endmodule

module VgaSyncGen (
  output reg          io_h_sync,
  output reg          io_v_sync,
  output reg          io_activevideo,
  output reg [9:0]    io_x,
  output reg [9:0]    io_y,
  input               clk,
  input               reset
);

  wire       [9:0]    _zz_h_counter_valueNext;
  wire       [0:0]    _zz_h_counter_valueNext_1;
  wire       [9:0]    _zz_v_counter_valueNext;
  wire       [0:0]    _zz_v_counter_valueNext_1;
  reg                 h_counter_willIncrement;
  wire                h_counter_willClear;
  reg        [9:0]    h_counter_valueNext;
  reg        [9:0]    h_counter_value;
  wire                h_counter_willOverflowIfInc;
  wire                h_counter_willOverflow;
  reg                 v_counter_willIncrement;
  wire                v_counter_willClear;
  reg        [9:0]    v_counter_valueNext;
  reg        [9:0]    v_counter_value;
  wire                v_counter_willOverflowIfInc;
  wire                v_counter_willOverflow;
  wire                when_VgaSyncGen_l29;
  wire                when_VgaSyncGen_l36;
  wire                when_VgaSyncGen_l44;
  function  zz_h_counter_willIncrement(input dummy);
    begin
      zz_h_counter_willIncrement = 1'b0; // @[Utils.scala 536:23]
      zz_h_counter_willIncrement = 1'b1; // @[Utils.scala 540:41]
    end
  endfunction
  wire  _zz_1;

  assign _zz_h_counter_valueNext_1 = h_counter_willIncrement;
  assign _zz_h_counter_valueNext = {9'd0, _zz_h_counter_valueNext_1};
  assign _zz_v_counter_valueNext_1 = v_counter_willIncrement;
  assign _zz_v_counter_valueNext = {9'd0, _zz_v_counter_valueNext_1};
  assign _zz_1 = zz_h_counter_willIncrement(1'b0);
  always @(*) h_counter_willIncrement = _zz_1;
  assign h_counter_willClear = 1'b0; // @[Utils.scala 537:19]
  assign h_counter_willOverflowIfInc = (h_counter_value == 10'h31f); // @[BaseType.scala 305:24]
  assign h_counter_willOverflow = (h_counter_willOverflowIfInc && h_counter_willIncrement); // @[BaseType.scala 305:24]
  always @(*) begin
    if(h_counter_willOverflow) begin
      h_counter_valueNext = 10'h0; // @[Utils.scala 552:17]
    end else begin
      h_counter_valueNext = (h_counter_value + _zz_h_counter_valueNext); // @[Utils.scala 554:17]
    end
    if(h_counter_willClear) begin
      h_counter_valueNext = 10'h0; // @[Utils.scala 558:15]
    end
  end

  always @(*) begin
    v_counter_willIncrement = 1'b0; // @[Utils.scala 536:23]
    if(h_counter_willOverflow) begin
      v_counter_willIncrement = 1'b1; // @[Utils.scala 540:41]
    end
  end

  assign v_counter_willClear = 1'b0; // @[Utils.scala 537:19]
  assign v_counter_willOverflowIfInc = (v_counter_value == 10'h20b); // @[BaseType.scala 305:24]
  assign v_counter_willOverflow = (v_counter_willOverflowIfInc && v_counter_willIncrement); // @[BaseType.scala 305:24]
  always @(*) begin
    if(v_counter_willOverflow) begin
      v_counter_valueNext = 10'h0; // @[Utils.scala 552:17]
    end else begin
      v_counter_valueNext = (v_counter_value + _zz_v_counter_valueNext); // @[Utils.scala 554:17]
    end
    if(v_counter_willClear) begin
      v_counter_valueNext = 10'h0; // @[Utils.scala 558:15]
    end
  end

  assign when_VgaSyncGen_l29 = ((10'h010 <= h_counter_value) && (h_counter_value <= 10'h070)); // @[BaseType.scala 305:24]
  always @(*) begin
    if(when_VgaSyncGen_l29) begin
      io_h_sync = 1'b0; // @[VgaSyncGen.scala 30:19]
    end else begin
      io_h_sync = 1'b1; // @[VgaSyncGen.scala 32:19]
    end
  end

  assign when_VgaSyncGen_l36 = ((10'h00b <= v_counter_value) && (v_counter_value <= 10'h00d)); // @[BaseType.scala 305:24]
  always @(*) begin
    if(when_VgaSyncGen_l36) begin
      io_v_sync = 1'b0; // @[VgaSyncGen.scala 37:19]
    end else begin
      io_v_sync = 1'b1; // @[VgaSyncGen.scala 39:19]
    end
  end

  assign when_VgaSyncGen_l44 = ((10'h0a0 <= h_counter_value) && (10'h02c <= v_counter_value)); // @[BaseType.scala 305:24]
  always @(*) begin
    if(when_VgaSyncGen_l44) begin
      io_activevideo = 1'b1; // @[VgaSyncGen.scala 45:24]
    end else begin
      io_activevideo = 1'b0; // @[VgaSyncGen.scala 49:24]
    end
  end

  always @(*) begin
    if(when_VgaSyncGen_l44) begin
      io_x = (h_counter_value - 10'h0a0); // @[VgaSyncGen.scala 46:14]
    end else begin
      io_x = 10'h0; // @[VgaSyncGen.scala 50:14]
    end
  end

  always @(*) begin
    if(when_VgaSyncGen_l44) begin
      io_y = (v_counter_value - 10'h02c); // @[VgaSyncGen.scala 47:14]
    end else begin
      io_y = 10'h0; // @[VgaSyncGen.scala 51:14]
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      h_counter_value <= 10'h0; // @[Data.scala 400:33]
      v_counter_value <= 10'h0; // @[Data.scala 400:33]
    end else begin
      h_counter_value <= h_counter_valueNext; // @[Reg.scala 39:30]
      v_counter_value <= v_counter_valueNext; // @[Reg.scala 39:30]
    end
  end


endmodule

module ClockCounters (
  output     [5:0]    io_seconds,
  output     [5:0]    io_minutes,
  output     [3:0]    io_hours,
  input               clk,
  input               reset
);

  wire       [24:0]   _zz_c_counter_valueNext;
  wire       [0:0]    _zz_c_counter_valueNext_1;
  wire       [5:0]    _zz_s_counter_valueNext;
  wire       [0:0]    _zz_s_counter_valueNext_1;
  wire       [5:0]    _zz_m_counter_valueNext;
  wire       [0:0]    _zz_m_counter_valueNext_1;
  wire       [3:0]    _zz_h_counter_valueNext;
  wire       [0:0]    _zz_h_counter_valueNext_1;
  reg                 c_counter_willIncrement;
  wire                c_counter_willClear;
  reg        [24:0]   c_counter_valueNext;
  reg        [24:0]   c_counter_value;
  wire                c_counter_willOverflowIfInc;
  wire                c_counter_willOverflow;
  reg                 s_counter_willIncrement;
  wire                s_counter_willClear;
  reg        [5:0]    s_counter_valueNext;
  reg        [5:0]    s_counter_value;
  wire                s_counter_willOverflowIfInc;
  wire                s_counter_willOverflow;
  reg                 m_counter_willIncrement;
  wire                m_counter_willClear;
  reg        [5:0]    m_counter_valueNext;
  reg        [5:0]    m_counter_value;
  wire                m_counter_willOverflowIfInc;
  wire                m_counter_willOverflow;
  reg                 h_counter_willIncrement;
  wire                h_counter_willClear;
  reg        [3:0]    h_counter_valueNext;
  reg        [3:0]    h_counter_value;
  wire                h_counter_willOverflowIfInc;
  wire                h_counter_willOverflow;
  function  zz_c_counter_willIncrement(input dummy);
    begin
      zz_c_counter_willIncrement = 1'b0; // @[Utils.scala 536:23]
      zz_c_counter_willIncrement = 1'b1; // @[Utils.scala 540:41]
    end
  endfunction
  wire  _zz_1;

  assign _zz_c_counter_valueNext_1 = c_counter_willIncrement;
  assign _zz_c_counter_valueNext = {24'd0, _zz_c_counter_valueNext_1};
  assign _zz_s_counter_valueNext_1 = s_counter_willIncrement;
  assign _zz_s_counter_valueNext = {5'd0, _zz_s_counter_valueNext_1};
  assign _zz_m_counter_valueNext_1 = m_counter_willIncrement;
  assign _zz_m_counter_valueNext = {5'd0, _zz_m_counter_valueNext_1};
  assign _zz_h_counter_valueNext_1 = h_counter_willIncrement;
  assign _zz_h_counter_valueNext = {3'd0, _zz_h_counter_valueNext_1};
  assign _zz_1 = zz_c_counter_willIncrement(1'b0);
  always @(*) c_counter_willIncrement = _zz_1;
  assign c_counter_willClear = 1'b0; // @[Utils.scala 537:19]
  assign c_counter_willOverflowIfInc = (c_counter_value == 25'h17d783f); // @[BaseType.scala 305:24]
  assign c_counter_willOverflow = (c_counter_willOverflowIfInc && c_counter_willIncrement); // @[BaseType.scala 305:24]
  always @(*) begin
    if(c_counter_willOverflow) begin
      c_counter_valueNext = 25'h0; // @[Utils.scala 552:17]
    end else begin
      c_counter_valueNext = (c_counter_value + _zz_c_counter_valueNext); // @[Utils.scala 554:17]
    end
    if(c_counter_willClear) begin
      c_counter_valueNext = 25'h0; // @[Utils.scala 558:15]
    end
  end

  always @(*) begin
    s_counter_willIncrement = 1'b0; // @[Utils.scala 536:23]
    if(c_counter_willOverflow) begin
      s_counter_willIncrement = 1'b1; // @[Utils.scala 540:41]
    end
  end

  assign s_counter_willClear = 1'b0; // @[Utils.scala 537:19]
  assign s_counter_willOverflowIfInc = (s_counter_value == 6'h3b); // @[BaseType.scala 305:24]
  assign s_counter_willOverflow = (s_counter_willOverflowIfInc && s_counter_willIncrement); // @[BaseType.scala 305:24]
  always @(*) begin
    if(s_counter_willOverflow) begin
      s_counter_valueNext = 6'h0; // @[Utils.scala 552:17]
    end else begin
      s_counter_valueNext = (s_counter_value + _zz_s_counter_valueNext); // @[Utils.scala 554:17]
    end
    if(s_counter_willClear) begin
      s_counter_valueNext = 6'h0; // @[Utils.scala 558:15]
    end
  end

  always @(*) begin
    m_counter_willIncrement = 1'b0; // @[Utils.scala 536:23]
    if(s_counter_willOverflow) begin
      m_counter_willIncrement = 1'b1; // @[Utils.scala 540:41]
    end
  end

  assign m_counter_willClear = 1'b0; // @[Utils.scala 537:19]
  assign m_counter_willOverflowIfInc = (m_counter_value == 6'h3b); // @[BaseType.scala 305:24]
  assign m_counter_willOverflow = (m_counter_willOverflowIfInc && m_counter_willIncrement); // @[BaseType.scala 305:24]
  always @(*) begin
    if(m_counter_willOverflow) begin
      m_counter_valueNext = 6'h0; // @[Utils.scala 552:17]
    end else begin
      m_counter_valueNext = (m_counter_value + _zz_m_counter_valueNext); // @[Utils.scala 554:17]
    end
    if(m_counter_willClear) begin
      m_counter_valueNext = 6'h0; // @[Utils.scala 558:15]
    end
  end

  always @(*) begin
    h_counter_willIncrement = 1'b0; // @[Utils.scala 536:23]
    if(m_counter_willOverflow) begin
      h_counter_willIncrement = 1'b1; // @[Utils.scala 540:41]
    end
  end

  assign h_counter_willClear = 1'b0; // @[Utils.scala 537:19]
  assign h_counter_willOverflowIfInc = (h_counter_value == 4'b1011); // @[BaseType.scala 305:24]
  assign h_counter_willOverflow = (h_counter_willOverflowIfInc && h_counter_willIncrement); // @[BaseType.scala 305:24]
  always @(*) begin
    if(h_counter_willOverflow) begin
      h_counter_valueNext = 4'b0000; // @[Utils.scala 552:17]
    end else begin
      h_counter_valueNext = (h_counter_value + _zz_h_counter_valueNext); // @[Utils.scala 554:17]
    end
    if(h_counter_willClear) begin
      h_counter_valueNext = 4'b0000; // @[Utils.scala 558:15]
    end
  end

  assign io_seconds = s_counter_value; // @[ClockCounters.scala 33:16]
  assign io_minutes = m_counter_value; // @[ClockCounters.scala 34:16]
  assign io_hours = h_counter_value; // @[ClockCounters.scala 35:16]
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      c_counter_value <= 25'h0; // @[Data.scala 400:33]
      s_counter_value <= 6'h0; // @[Data.scala 400:33]
      m_counter_value <= 6'h0; // @[Data.scala 400:33]
      h_counter_value <= 4'b0000; // @[Data.scala 400:33]
    end else begin
      c_counter_value <= c_counter_valueNext; // @[Reg.scala 39:30]
      s_counter_value <= s_counter_valueNext; // @[Reg.scala 39:30]
      m_counter_value <= m_counter_valueNext; // @[Reg.scala 39:30]
      h_counter_value <= h_counter_valueNext; // @[Reg.scala 39:30]
    end
  end


endmodule
