Shader "Test/Test1"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            // make fog work
            #pragma multi_compile_fog

            #include "UnityCG.cginc"

            struct VertIn
            {
                float4 vertex : POSITION;
                float4 normal : NORMAL;
            };

            struct VertOut
            {
                float4 vertex : SV_POSITION;
                float4 color : COLOR0;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;

            VertOut vert (VertIn v)
            {
                VertOut o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.color = v.normal;
                return o;
            }

            fixed4 frag (VertOut i) : SV_Target
            {
                fixed4 col = i.color;
                return col;
            }
            ENDCG
        }
    }
}
