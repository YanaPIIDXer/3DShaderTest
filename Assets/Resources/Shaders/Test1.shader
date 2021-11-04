Shader "Test/Test1"
{
    Properties
    {
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
