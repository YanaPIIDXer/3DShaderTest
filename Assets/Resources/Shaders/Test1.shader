Shader "Test/Test1"
{
    Properties
    {
        _BaseColor ("Base Color", Color) = (1, 1, 1, 1)
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
                float4 normal : NORMAL;
            };

            VertOut vert (VertIn v)
            {
                VertOut o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.normal = v.normal;
                return o;
            }

            fixed4 _BaseColor;

            fixed4 frag (VertOut i) : SV_Target
            {
                float4 invLightDir = mul(UNITY_MATRIX_M, _WorldSpaceLightPos0);
                float power = dot(normalize(i.normal), invLightDir.xyz);
                fixed4 col = _BaseColor * power;
                return col;
            }
            ENDCG
        }
    }
}
