shader_type canvas_item;

uniform float grain_intensity : hint_range(0.0, 1.0) = 0.1;
uniform float sepia_tone : hint_range(0.0, 1.0) = 0.5;
uniform float vignette_intensity : hint_range(0.0, 1.0) = 0.5;
uniform float vignette_radius : hint_range(0.0, 1.5) = 0.75;

uniform sampler2D screen_texture : hint_screen_texture;

void fragment() {
    // Obtener las coordenadas UV
    vec2 uv = SCREEN_UV;

    // Obtener el color original de la pantalla
    vec4 original_color = texture(screen_texture, uv);

    // Efecto de grano de película
    float grain = (fract(sin(dot(uv * 1000.0, vec2(12.9898, 78.233))) * 43758.5453) - 0.5) * grain_intensity;
    vec3 grain_color = original_color.rgb + vec3(grain);

    // Efecto de viñeta
    vec2 pos = uv - vec2(0.5);
    float vignette = smoothstep(vignette_radius, vignette_radius - vignette_intensity, length(pos));
    grain_color *= vignette;

    // Efecto sepia
    vec3 sepia = vec3(1.2, 1.0, 0.8);
    vec3 final_color = mix(grain_color, grain_color * sepia, sepia_tone);

    // Salida del color final
    COLOR = vec4(final_color, original_color.a);
}
