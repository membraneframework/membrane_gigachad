defmodule Membrane.Gigachad.Mixfile do
  use Mix.Project

  @version "0.1.0"
  @github_url "https://github.com/membraneframework-labs/membrane_gigachad"

  def project do
    [
      app: :membrane_gigachad,
      version: @version,
      elixir: "~> 1.13",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: dialyzer(),

      # hex
      description: "Package providing all plugins of the Membrane Framework",
      package: package(),

      # docs
      name: "Membrane gigachad",
      source_url: @github_url,
      docs: docs()
    ]
  end

  def application do
    [
      extra_applications: []
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_env), do: ["lib"]

  defp deps do
    [
      {:membrane_core, "~> 0.11.3"},
      {:membrane_h264_ffmpeg_plugin, "~> 0.25.4"},
      {:membrane_file_plugin, "~> 0.13.2"},
      {:membrane_common_c, "~> 0.14.0"},
      {:membrane_mp4_plugin, "~> 0.19.0"},
      {:membrane_tee_plugin, "~> 0.10.1"},
      {:membrane_aac_plugin, "~> 0.13.0"},
      {:membrane_rtp_h264_plugin, "~> 0.15.1"},
      {:membrane_rtp_opus_plugin, "~> 0.7.0"},
      {:membrane_rtp_plugin, "~> 0.21.0"},
      {:membrane_funnel_plugin, "~> 0.7.0"},
      # {:membrane_ice_plugin, "~> 0.14.3"},
      {:membrane_rtp_vp8_plugin, "~> 0.7.1"},
      {:membrane_opus_plugin, "~> 0.16.0"},
      # {:membrane_webrtc_plugin, "~> 0.14.2"},
      {:membrane_aac_fdk_plugin, "~> 0.14.0"},
      {:membrane_realtimer_plugin, "~> 0.6.1"},
      {:membrane_framerate_converter_plugin, "~> 0.6.0"},
      # {:membrane_video_compositor_plugin, "~> 0.2.1"},
      {:membrane_generator_plugin, "~> 0.8.0"},
      # {:membrane_rtc_engine, "~> 0.11.0"},
      {:membrane_audio_mix_plugin, "~> 0.12.0"},
      {:membrane_audio_filler_plugin, "~> 0.1.0"},
      {:membrane_rtmp_plugin, "~> 0.11.2"},
      {:membrane_flv_plugin, "~> 0.5.0"},
      {:membrane_ffmpeg_swscale_plugin, "~> 0.11.0"},
      {:membrane_video_merger_plugin, "~> 0.7.0"},
      {:membrane_stream_plugin, "~> 0.2.1"},
      # {:membrane_sdl_plugin, "~> 0.15.0"},
      {:membrane_ffmpeg_video_filter_plugin, "~> 0.9.0"},
      {:membrane_ffmpeg_swresample_plugin, "~> 0.16.1"},
      {:membrane_udp_plugin, "~> 0.9.2"},
      {:membrane_h264_plugin, "~> 0.2.1"},
      {:membrane_portaudio_plugin, "~> 0.15.0"},
      {:bunch, "~> 1.6", override: true},
      {:membrane_mp3_mad_plugin, "~> 0.14.0"},
      {:membrane_fake_plugin, "~> 0.9.0"},
      {:membrane_hackney_plugin, "~> 0.9.0"},
      {:membrane_raw_video_parser_plugin, "~> 0.9.0"},
      {:membrane_wav_plugin, "~> 0.8.0"},
      {:membrane_rtp_mpegaudio_plugin, "~> 0.12.0"},
      {:membrane_audiometer_plugin, "~> 0.10.1"},
      {:membrane_camera_capture_plugin, "~> 0.4.0"},
      {:membrane_ivf_plugin, "~> 0.5.0"},
      {:membrane_matroska_plugin, "~> 0.2.1"},
      {:membrane_scissors_plugin, "~> 0.6.0"},
      {:membrane_flac_plugin, "~> 0.9.0"},
      {:membrane_ffmpeg_generator, "~> 0.1.0"},
      {:membrane_ogg_plugin, "~> 0.1.0"},
      {:membrane_mp3_lame_plugin, "~> 0.15.0"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:dialyxir, ">= 0.0.0", only: :dev, runtime: false},
      {:credo, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp dialyzer() do
    opts = [
      flags: [:error_handling]
    ]

    if System.get_env("CI") == "true" do
      # Store PLTs in cacheable directory for CI
      [plt_local_path: "priv/plts", plt_core_path: "priv/plts"] ++ opts
    else
      opts
    end
  end

  defp package do
    [
      maintainers: ["Membrane Team"],
      licenses: ["Apache-2.0"],
      links: %{
        "GitHub" => @github_url,
        "Membrane Framework Homepage" => "https://membraneframework.org"
      }
    ]
  end

  defp docs do
    [
      main: "readme",
      extras: ["README.md", "LICENSE"],
      formatters: ["html"],
      source_ref: "v#{@version}",
      nest_modules_by_prefix: [Membrane.Gigachad]
    ]
  end
end
