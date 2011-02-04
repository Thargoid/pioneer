#ifndef GUIMETERBAR_H
#define GUIMETERBAR_H

#include "Color.h"
#include "GuiLabel.h"
#include "GuiFixed.h"

/* A cute horizontal bar readout of some value from 0 to 1,
   with a text label also. Hull and weapon temperature are shown with these  */
namespace Gui {
	class MeterBar: public Gui::Fixed {
	public:
		MeterBar(float width, const char *label, const ::Color &graphCol);
		virtual ~MeterBar() {}
		virtual void Draw();
		virtual void GetSizeRequested(float size[2]);
		void SetValue(float v) { m_barValue = CLAMP(v,0.0f,1.0f); }
		void SetColor(const ::Color &c) { m_barColor = c; }
	private:
		float m_requestedWidth;
		Gui::Label *m_label;
		::Color m_barColor;
		float m_barValue;
	};
}

#endif /* GUIMETERBAR_H */